variable "build_name" {
  description = "The Project's name."
  type = string
}

variable "build_description" {
  description = "(Optional) Short description of the project."
  type = string
  default = null
}

variable "iam_role" {
  description = "An AWS CodeBuild service role so that CodeBuild can interact with dependent AWS services on your behalf"
  type = string
  default = null
}

variable "artifact_type" {
  description = "The build output artifact's type. Valid values for this parameter are: CODEPIPELINE, NO_ARTIFACTS or S3"
  type = string
  default = "NO_ARTIFACTS"
}

variable "build_compute_type" {
  description = "Instance type of the build instance"
  type = string
  default = "BUILD_GENERAL1_SMALL"
}

variable "build_type" {
  description = "The type of build environment, e.g. 'LINUX_CONTAINER' or 'WINDOWS_CONTAINER'"
  type        = string
  default     = "LINUX_CONTAINER"
}

variable "build_image" {
  description = "Docker image for build environment, e.g. 'aws/codebuild/standard:3.0' or 'aws/codebuild/eb-nodejs-6.10.0-amazonlinux-64:4.0.0'. For more info: http://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref.html"
  type        = string
  default     = "aws/codebuild/standard:3.0"
}

variable "build_image_pull_credentials_type" {
  description = "Type of credentials AWS CodeBuild uses to pull images in your build.Valid values: CODEBUILD, SERVICE_ROLE. When you use a cross-account or private registry image, you must use SERVICE_ROLE credentials."
  type        = string
  default     = "CODEBUILD"
}

variable "privileged_mode" {
  description = "(Optional) If set to true, enables running the Docker daemon inside a Docker container on the CodeBuild instance. Used when building Docker images"
  type        = bool
  default     = true
}

variable "aws_region" {
  description = "(Optional) AWS Region, e.g. us-east-1. Used as CodeBuild ENV variable when building Docker images. For more info: http://docs.aws.amazon.com/codebuild/latest/userguide/sample-docker.html"
  type        = string
  default     = ""
}

variable "aws_account_id" {
  description = "(Optional) AWS Account ID. Used as CodeBuild ENV variable when building Docker images. For more info: http://docs.aws.amazon.com/codebuild/latest/userguide/sample-docker.html"
  type        = string
  default     = ""
}

variable "image_tag" {
  description = "(Optional) Docker image tag in the ECR repository, e.g. 'latest'. Used as CodeBuild ENV variable when building Docker images. For more info: http://docs.aws.amazon.com/codebuild/latest/userguide/sample-docker.html"
  type        = string
  default     = "latest"
}

variable "image_repo_name" {
  description = "(Optional) ECR repository name to store the Docker image built by this module. Used as CodeBuild ENV variable when building Docker images. For more info: http://docs.aws.amazon.com/codebuild/latest/userguide/sample-docker.html"
  type        = string
  default     = "catpipeline"
}

variable "logs_config" {
  description = "Configuration for the builds to store log data to CloudWatch or S3."
  type        = any
  default     = {}
}

variable "cw_logs_group_name" {
  description = "Log Group name that is to be used in CloudWatch Logs."
  type = string
  default = "a4l-codebuild"
}

variable "cw_logs_stream_name" {
  description = "Log Stream name that is to be used in CloudWatch Logs."
  type = string
  default = "catpipeline"
}

variable "source_type" {
  description = "The type of repository that contains the source code to be built. Valid values for this parameter are: CODECOMMIT, CODEPIPELINE, GITHUB, GITHUB_ENTERPRISE, BITBUCKET or S3"
  type        = string
  default     = "CODECOMMIT"
}

variable "buildspec" {
  description = "Optional buildspec declaration to use for building the project"
  type        = string
  default     = "buildspec.yml"
}

variable "source_location" {
  description = "The location of the source code from git or s3"
  type        = string
}

variable "git_clone_depth" {
  description = "Truncate git history to this many commits."
  type        = number
  default     = null
}