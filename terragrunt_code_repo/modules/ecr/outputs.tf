output "repository_name" {
    description = "ECR repo name"
    value       = aws_ecr_repository.catpipeline.name
}

output "repo_url" {
    description = "The URL of the repository (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)."
    value       = aws_ecr_repository.catpipeline.repository_url
}