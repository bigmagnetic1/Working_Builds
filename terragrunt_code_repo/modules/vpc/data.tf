data "aws_caller_identity" "default" {}

data "aws_region" "default" {}

data "aws_availability_zones" "available" {}

data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }
}

data "aws_subnet" "public_subnet_list" {
  count = length(data.aws_subnets.private.ids)
  id    = data.aws_subnets.private.ids[count.index]
}

data "aws_subnet" "private_subnet_list" {
  count = length(data.aws_subnets.public.ids)
  id    = data.aws_subnets.private.ids[count.index]
}

# data "aws_subnet" "each_subnet" {
#   for_each = toset(data.aws_subnets.all_subnets.ids)
#   id       = each.value
# }

data "aws_internet_gateway" "default_gw" {
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }
}

# data "aws_route_table" "selected" {
#   subnet_id = aws_default_subnet.default_az1.id
# }