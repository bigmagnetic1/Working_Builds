data "aws_codecommit_repository" "pipeline_repo" {
  repository_name = "catPipeline-CodeCommit2"
}