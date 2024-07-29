# output "default_private_subnet_ids" {
#   description = "List of default subnet id's."
#   value = aws_default_subnet.default_az1.id
# }

output "default_vpc_id" {
  description = "Default VPC ID."
  value = data.aws_vpc.default_vpc.id
}

output "default_subnet_1" {
  description = "Subnet ID for default subnet in us-west-2a"
  value = aws_default_subnet.default_az1.id
}

output "default_subnet_2" {
  description = "Subnet ID for default subnet in us-west-2b"
  value = aws_default_subnet.default_az2.id
}

output "default_subnet_3" {
  description = "Subnet ID for default subnet in us-west-2c"
  value = aws_default_subnet.default_az3.id
}

output "default_subnet_4" {
  description = "Subnet ID for default subnet in us-west-2d"
  value = aws_default_subnet.default_az4.id
}