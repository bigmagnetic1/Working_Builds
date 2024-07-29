# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
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
