resource "aws_ecr_repository" "catpipeline" {
  name                 = var.repo_name
  image_tag_mutability = "MUTABLE"
  force_delete         = var.force_delete

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
}