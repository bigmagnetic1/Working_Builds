output "project_name" {
  description = "Codebuild project name."
  value = aws_codebuild_project.catpipeline_build.name
}