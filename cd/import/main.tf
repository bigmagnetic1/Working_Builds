provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "aws_vpc" "newvpc2" {
  cidr_block = "192.168.0.0/24"
}