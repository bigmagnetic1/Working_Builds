module "cat_image_repo" {
    source = "../../../../../../modules/ecr"

    repo_name = "catpipeline"
}