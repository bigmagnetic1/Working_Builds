# --------------------------------------------------
# Infrastructure configuration
# --------------------------------------------------

locals {
  # Read hcl from environment
  environment_hcl_path   = find_in_parent_folders("environment.hcl")
  environment_hcl_config = read_terragrunt_config(local.environment_hcl_path)

  # Get vars from environment
  aws_provider_region       = try(local.environment_hcl_config.locals.aws_provider_region, "us-west-2")
  aws_profile               = try(local.environment_hcl_config.locals.aws_profile, "unknown")
  environment_name          = try(local.environment_hcl_config.locals.environment_name, "unknown")
  account_id                = try(local.environment_hcl_config.locals.account_id, "unknown")
  cost_center               = "infrastructure"
  platform_name             = "infrastructure"
  resource_owner            = "infrastructure"
}

terraform {
  extra_arguments "aws_profile" {

    commands = [
        "init",
        "apply",
        "refresh",
        "import",
        "plan",
        "taint",
        "untaint"
    ]

    env_vars = {
        AWS_PROFILE = "${local.aws_profile}"
        AWS_REGION  = "${local.aws_provider_region}"
    }
  }
}

### Generate s3 backend for terraform states
remote_state {
    backend = "s3"
    generate = {
        path = "tg_backend.tf"
        if_exists = "overwrite_terragrunt"
    }
    config = {
        bucket                      = "terraform-backend-${local.aws_profile}-jmm"
        key                         = "infrastructure/${path_relative_to_include()}/terraform.tfstate"
        region                      = local.aws_provider_region
        encrypt                     = true
        dynamodb_table              = "terraform-backend-lock-table-${local.aws_profile}"
        accesslogging_bucket_name   = "terraform-backend-logging-${local.aws_profile}"
        accesslogging_target_prefix = "log/"
        skip_bucket_versioning      = false
        skip_bucket_ssencryption    = false
        skip_bucket_enforced_tls    = false
        skip_bucket_root_access     = false
        profile                     = local.aws_profile
    }
}

### Generate an AWS profiles block
generate "main_providers" {
  path      = "tg_provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
  #########################################################################################
  # Note: This file has been generated by Terragrunt using the terragrunt init command.   #
  # Any modifications made to this file may be overwritten the next time terragrunt init  #
  # is executed.                                                                          #
  #########################################################################################
  provider "aws" {
    region  = "${local.aws_provider_region}"
    profile = "${local.aws_profile}"

    default_tags {
      tags = {
        Owner = "${local.resource_owner}"
        Platform = "${local.platform_name}"
        Environment = "${local.environment_name}"
        CostCenter  = "${local.cost_center}"
        TerraformRepo = "infrastructure"
        TerraformPath = "${path_relative_to_include()}"
      }
    }
  }

  provider "aws" {
    region  = "${local.aws_provider_region}"
    profile = "prod"
    alias   = "prd"

    default_tags {
      tags = {
        Environment = "prd"
        Owner       = "mauvais7k@gmail.com"
        Platform    = "${local.platform_name}"
        CostCenter  = "${local.cost_center}"
        TerraformRepo = "infrastructure"
        TerraformPath = "${path_relative_to_include()}"
      }
    }
  }

  provider "aws" {
    region  = "${local.aws_provider_region}"
    profile = "test"
    alias   = "stg"

    default_tags {
      tags = {
        Environment = "stg"
        Owner       = "mauvais7k@gmail.com"
        Platform    = "${local.platform_name}"
        CostCenter  = "${local.cost_center}"
        TerraformRepo = "infrastructure"
        TerraformPath = "${path_relative_to_include()}"
      }
    }
  }

  provider "aws" {
    region  = "${local.aws_provider_region}"
    profile = "dev"
    alias   = "dev"

    default_tags {
      tags = {
        Environment = "dev"
        Owner       = "mauvais7k@gmail.com"
        Platform    = "${local.platform_name}"
        CostCenter  = "${local.cost_center}"
        TerraformRepo = "infrastructure"
        TerraformPath = "${path_relative_to_include()}"
      }
    }
  }

  ## Required for non hashicorp providers
  terraform {
    required_providers {
      docker = {
        source  = "kreuzwerker/docker"
        version = "3.0.2"
      }
    }
  }

EOF
}

generate "tg_vars" {
  path      = "tg_vars.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
  #########################################################################################
  # Note: This file has been generated by Terragrunt using the terragrunt init command.   #
  # Any modifications made to this file may be overwritten the next time terragrunt init  #
  # is executed.                                                                          #
  #########################################################################################
  variable "aws_provider_region" {
    type        = string
    description = "AWS Region"
  }

  variable "environment_name" {
    type        = string
    description = "The name of the deployment environment"
  }

  variable "platform_name" {
    type        = string
    description = "The name of the platform in which this terraform will be deployed"
  }

  variable "cost_center" {
    type        = string
    description = "The name of the cost center in which this terraform is associated aand tagged with"
  }

  variable "resource_owner" {
    type        = string
    description = "The owner of the resource that terraform will deploy and be tagged with"
  }
  EOF
}

generate "tg_data" {
  path = "tg_data.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  #########################################################################################
  # Note: This file has been generated by Terragrunt using the terragrunt init command.   #
  # Any modifications made to this file may be overwritten the next time terragrunt init  #
  # is executed.                                                                          #
  #########################################################################################
  data "aws_caller_identity" "caller" {}
  data "aws_partition" "current" {}
  data "aws_region" "current" {}
  EOF
}

# Configure root level variables that all resources can inherit. This is especially helpful with multi-account configs
# where terraform_remote_state data sources are placed direclty into the modules.
inputs = merge(
  local,
  local.environment_hcl_config.locals
)

generate = local.environment_hcl_config.generate