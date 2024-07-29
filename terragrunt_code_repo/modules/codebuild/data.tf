data "aws_caller_identity" "default" {}

data "aws_region" "default" {}

data "aws_vpc" "default_vpc" {
  default = true
}