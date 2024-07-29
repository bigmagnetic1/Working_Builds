module "codebuild_role" {
  source = "../iam_role"
  role_principals = [
    {
        type = "Service"
        identifiers = ["codebuild.amazonaws.com"]
    }
  ]
  role_name = "codebuild-${var.build_name}-service-role2"
}

data "aws_iam_policy_document" "access_policy_document" {
    statement {
      sid = "CloudWatchLogsPolicy"
      effect = "Allow"
      actions = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ]
      resources = [
        "*"
      ]
    }

    statement {
      sid = "CodeCommitPolicy"
      effect = "Allow"
      actions = [
        "codecommit:GitPull"
      ]
      resources = [
        "*"
      ]
    }

    statement {
      sid = "S3Policy"
      effect = "Allow"
      actions = [
        "s3:GetObject",
        "s3:GetObjectVersion",
        "s3:GetBucketVersioning",
        "s3:PutObject"
      ]
      resources = [
        "*"
      ]
    }

    statement {
      sid = "ECRPolicy"
      effect = "Allow"
      actions = [
        "ecr:BatchGetImage",
        "ecr:BatchCheckLayerAvailability",
        "ecr:CompleteLayerUpload",
        "ecr:DescribeImages",
        "ecr:DescribeRepositories",
        "ecr:GetAuthorizationToken",
        "ecr:GetDownloadUrlForLayer",
        "ecr:InitiateLayerUpload",
        "ecr:ListImages",
        "ecr:PutImage",
        "ecr:UploadLayerPart",
      ]
      resources = [
        "*"
      ]
    }
}

resource "aws_iam_policy" "access_policy" {
  name = "${module.codebuild_role.role_name}-policy"
  policy = data.aws_iam_policy_document.access_policy_document.json
  depends_on = [ module.codebuild_role ]
}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
  role = module.codebuild_role.role_name
  policy_arn = aws_iam_policy.access_policy.arn
  depends_on = [ module.codebuild_role ]
}