# resource "aws_default_subnet" "default_subnets" {
#   count = length(data.aws_availability_zones.available)
#   availability_zone = element(data.aws_availability_zones.available, (count.index % length(data.aws_availability_zones.available)))
#   map_public_ip_on_launch = var.public_ip_launch
# }
# resource "aws_default_subnet" "default_public_subnets" {
#   count                   = length(data.aws_availability_zones.available.names)
#   availability_zone       = element(data.aws_availability_zones.available.names, count.index)
#   map_public_ip_on_launch = true
#   #vpc_id                  = data.aws_vpc.default_vpc.id
# }

# resource "aws_default_subnet" "default_public_subnet_1" {
#   availability_zone       = "us-west-2a"
#   map_public_ip_on_launch = true
#   #vpc_id                  = data.aws_vpc.default_vpc.id
# }

# resource "aws_default_subnet" "default_public_subnet_2" {
#   availability_zone       = "us-west-2b"
#   map_public_ip_on_launch = true
#   #vpc_id                  = data.aws_vpc.default_vpc.id
# }

# resource "aws_default_subnet" "default_public_subnet_3" {
#     for_each = data.aws_availability_zones.available
#   availability_zone       = toset(each.value.names)
#   map_public_ip_on_launch = true
#   #vpc_id                  = data.aws_vpc.default_vpc.id
# }

resource "aws_default_subnet" "default_az1" {
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true
}
resource "aws_default_subnet" "default_az2" {
  availability_zone = "us-west-2b"
  map_public_ip_on_launch = true
}
resource "aws_default_subnet" "default_az3" {
  availability_zone = "us-west-2c"
  map_public_ip_on_launch = true
}
resource "aws_default_subnet" "default_az4" {
  availability_zone = "us-west-2d"
  map_public_ip_on_launch = true
}