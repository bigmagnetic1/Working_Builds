module "catpipeline_buld" {
    source = "../../../../../../modules/codebuild"

    build_name = "catpipeline-build"
    source_location = data.aws_codecommit_repository.pipeline_repo.clone_url_http
}