resource "aws_codecommit_repository" "pipeline_repo" {
  repository_name = var.repo_name
  description     = var.description
}