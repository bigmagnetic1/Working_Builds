module "code_pipeline" {
    source = "../../../../../../modules/codepipeline"
    
    pipeline_name      = "catpipeline"
    pipeline_repo_name = data.aws_codecommit_repository.pipeline_repo.repository_name
    pipeline_branch    = "master"
    codebuild_project  = module.catpipeline_buld.project_name
    ecs_cluster_name   = module.cat_cluster.cluster_name
    ecs_service_name   = module.cat_cluster.service_name
    image_file         = "imagedefinitions.json"
    s3_pipeline_bucket = module.cat_s3.bucket
}