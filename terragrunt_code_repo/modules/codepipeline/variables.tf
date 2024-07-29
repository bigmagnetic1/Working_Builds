variable "pipeline_name" {
  description = "Name of CI/CD pipeline."
  type = string
}

variable "s3_pipeline_bucket" {
  description = "Bucket used to store artifacts."
  type = string
}

variable "pipeline_repo_name" {
  description = "The name for the repository."
  type = string
}

variable "pipeline_branch" {
  description = "Desired git branch on which the pipeline will run."
  type = string
  default = "main"
}

variable "poll_for_change" {
  description = "Do you want to poll for source changes to the git repository?"
  type = bool
  default = true
}

variable "codebuild_project" {
  description = "Name of the Codebuld project."
  type = string
}

variable "deploy_provider" {
  description = "An action provider for CodePipeline."
  type = string
  default = "ECS"
}

variable "ecs_cluster_name" {
  description = "The Amazon ECS cluster in Amazon ECS."
  type = string
}

variable "ecs_service_name" {
  description = "The Amazon ECS service that you created in Amazon ECS."
  type = string
}

variable "image_file" {
  description = "The name of your image definitions file, the JSON file that describes the service's container name and the image and tag"
  type = string
}