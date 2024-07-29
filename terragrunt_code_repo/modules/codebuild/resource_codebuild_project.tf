resource "aws_codebuild_project" "catpipeline_build" {
    name         = var.build_name
    description  = var.build_description
    service_role = module.codebuild_role.role_arn

    artifacts {
        type = var.artifact_type
    }

    environment {
        type                        = var.build_type
        compute_type                = var.build_compute_type
        image                       = var.build_image
        image_pull_credentials_type = var.build_image_pull_credentials_type
        privileged_mode             = var.privileged_mode

        environment_variable {
          name  = "AWS_DEFAULT_REGION"
          value = local.aws_region
        }
        
        environment_variable {
          name = "AWS_ACCOUNT_ID"
          value = local.aws_account_id
        }
      
        dynamic "environment_variable" {
            for_each = signum(length(var.image_tag)) == 1 ? [""] : []
            content {
                name  = "IMAGE_TAG"
                value = var.image_tag
            }
        }

        environment_variable {
          name = "IMAGE_REPO_NAME"
          value = var.image_repo_name
        }
    }

    logs_config {
      cloudwatch_logs {
        group_name  = var.cw_logs_group_name
        stream_name = var.cw_logs_stream_name
        }
    }

    source { 
        type            = var.source_type
        buildspec       = var.buildspec
        location        = var.source_location #MUST BE THE HTTPS URL!!
        git_clone_depth = var.git_clone_depth != null ? var.git_clone_depth : null
    }   
}