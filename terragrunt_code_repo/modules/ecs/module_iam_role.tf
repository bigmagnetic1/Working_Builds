module "ecs_task_execution_role" {
  source = "../iam_role"
  role_principals = [
    {
        type = "Service"
        identifiers = ["ecs-tasks.amazonaws.com"]
    }
  ]
  role_name = "${var.cluster_name}-ecs_task_execution_role"
}

data "aws_iam_policy_document" "ecs_policy_document" {
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
      sid = "PrivateRegistryAuthentication"
      effect = "Allow"
      actions = [
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "kms:Decrypt",
        "secretsmanager:GetSecretValue"
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

resource "aws_iam_policy" "ecs_policy" {
  name = "${module.ecs_task_execution_role.role_name}-policy"
  policy = data.aws_iam_policy_document.ecs_policy_document.json
  depends_on = [ module.ecs_task_execution_role ]
}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
  role = module.ecs_task_execution_role.role_name
  policy_arn = aws_iam_policy.ecs_policy.arn
  depends_on = [ module.ecs_task_execution_role ]
}