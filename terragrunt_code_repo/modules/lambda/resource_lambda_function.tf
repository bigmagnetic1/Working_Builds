resource "aws_lambda_function" "function" {
    function_name = var.lambda_function_name
    description   = var.lambda_description
    role          = module.lambda_iam_role.role_arn
    package_type  = "Image"
    image_uri     = "${module.ecr_create_repo.repo_url}:latest"

    depends_on = [resource.null_resource.build_and_push_image]
}