resource "aws_ecr_lifecycle_policy" "image_policy" {
    count = var.ecr_repo_lifecycle_policy != null ? 1 : 0

    policy  = var.ecr_repo_lifecycle_policy
    repository = aws_ecr_repository.catpipeline.name
}