module "codepipeline_role" {
  source = "../iam_role"
  role_principals = [
    {
        type = "Service"
        identifiers = ["codepipeline.amazonaws.com"]
    }
  ]
  role_name = "${var.pipeline_name}-role"
}

data "aws_iam_policy_document" "access_policy_document" {
    statement {
      sid = "ECSPolicy"
      effect = "Allow"
      actions = [
        "ecs:UpdateService",
        "ecs:RegisterTaskDefinition"
      ]
      resources = [
        "*"
      ]
    }

    statement {
      sid = "IAMPolicy"
      effect = "Allow"
      actions = [
        "iam:PassRole"
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
      sid = "CodeCommitPolicy"
      effect = "Allow"
      actions = [
        "codecommit:GitPull",
        "codecommit:GetBranch",
        "codecommit:GetCommit",
        "codecommit:UploadArchive",
        "codecommit:GetUploadArchiveStatus",
        "codecommit:CancelUploadArchive"
      ]
      resources = [
        "*"
      ]
    }

    statement {
      sid = "CodeBuildPolicy"
      effect = "Allow"
      actions = [
        "codebuild:StartBuild",
        "codebuild:BatchGetBuilds"
      ]
      resources = [
        "*"
      ]
    }

    statement {
      sid = "ECSPermissions"
      effect = "Allow"
      actions = [
        "ecs:DescribeServices",
        "ecs:DescribeTaskDefinition",
        "ecs:DescribeTasks",
        "ecs:ListTasks",
        "ecs:RegisterTaskDefinition",
        "ecs:TagResource",
        "ecs:UpdateService"
      ]
      resources = [
        "*"
      ]
    }
}

resource "aws_iam_policy" "access_policy" {
  name = "${module.codepipeline_role.role_name}-policy"
  policy = data.aws_iam_policy_document.access_policy_document.json
  depends_on = [ module.codepipeline_role.role_name ]
}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
  role = module.codepipeline_role.role_name
  policy_arn = aws_iam_policy.access_policy.arn
  depends_on = [ module.codepipeline_role.role_name ]
}