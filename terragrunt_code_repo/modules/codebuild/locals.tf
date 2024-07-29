locals {
  aws_region     = signum(length(var.aws_region)) == 1 ? var.aws_region : data.aws_region.default.name
  aws_account_id = signum(length(var.aws_account_id)) == 1 ? var.aws_account_id : data.aws_caller_identity.default.account_id
}