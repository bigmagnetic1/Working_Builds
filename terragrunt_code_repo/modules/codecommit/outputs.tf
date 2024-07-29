output "repo_url" {
  description = "Codecommit HTTPS URL."
  value = aws_codecommit_repository.pipeline_repo.clone_url_http
}

output "repo_name" {
  description = "Codecommit repo name"
  value = aws_codecommit_repository.pipeline_repo.repository_name
}