module "lambda_iam_role" {
    source              = "../iam_role"

    role_principals     = [
        {
            type        = "Service"
            identifiers = ["lambda.amazonaws.com"]
        }
    ]
    role_name           = var.lambda_function_name    
}

#####################################
# Dependency access policy
#####################################

data "aws_iam_policy_document" "access_policy_document" {

    #################################
    # Allows ECR
    #################################

    statement {
        sid      = "AllowECR"
        effect   = "Allow"
        actions  = [
            "ecr:BatchGetImage",
            "ecr:DescribeImages",
            "ecr:DescribeRegistry",
            "ecr:DescribeRepositories",
            "ecr:GetAuthorizationToken",
            "ecr:GetDownloadUrlForLayer",
            "ecr:ListImages",
            "ecr:ListTagsForResource"
        ]
        resources = [
            "*"
        ]
    }
}

resource "aws_iam_policy" "access_policy" {
    name       = "${module.lambda_iam_role.role.role_name}-dependency-access"
    policy     = data.aws_iam_policy_document.access_policy_document.json

    depends_on = [module.lambda_iam_role.role]
}

resource "aws_iam_policy_attachment" "access_policy_attachment" {
    role       = module.lambda_iam_role.role_name
    policy_arn = aws_iam_policy.access_policy.policy_arn

    depends_on = [module.lambda_iam_role.role]
}