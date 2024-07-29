data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect              = "Allow"
    actions             = ["sts:AssumeRole"]

    dynamic "principals" {
        for_each        = var.role_principals
        content {
            type        = principals.value.type
            identifiers = distinct(principals.value.identifiers)
        }

    }
  }
}

resource "aws_iam_role" "role" {
  name               = var.role_name
  description        = var.role_description
  path               = var.role_path
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}