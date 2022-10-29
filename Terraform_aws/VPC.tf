########################### Public VPC #########################


  resource "aws_vpc" "vpc-03f80d508570a6397" {
  cidr_block       = "172.31.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "???VPC_1???"
  }

}