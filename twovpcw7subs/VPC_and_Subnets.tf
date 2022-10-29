############### VPC(1), 7 Subnets 2 Security Groups, 5 instances, ALB 

########################### Public VPC #########################


  resource "aws_vpc" "VPC_1" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "VPC_1"
  }

  }
  
  ########## Public Subnets ##################
  resource "aws_subnet" "pub1" {
  vpc_id     = aws_vpc.VPC_1.id
  cidr_block = "10.0.90.0/24"
  availability_zone = "us-east-1a"
  
  tags = {
    Name = "1a_1"
    Owner = "Rich"
    Location = "us-east-1a"
  }
  }
  resource "aws_subnet" "pub2" {
  vpc_id     = aws_vpc.VPC_1.id
  cidr_block = "10.0.80.0/24"
  availability_zone = "us-east-1b"
  
  tags = {
    Name = "1b_1"
    Owner = "Rich"
    Location = "us-east-1b"
  }
  }
  resource "aws_subnet" "pub3" {
  vpc_id     = aws_vpc.VPC_1.id
  cidr_block = "10.0.70.0/24"
  availability_zone = "us-east-1c"
  
  tags = {
    Name = "1c_1"
    Owner = "Rich"
    Location = "us-east-1c"
  }
  }
  resource "aws_subnet" "pub4" {
  vpc_id     = aws_vpc.VPC_1.id
  cidr_block = "10.0.60.0/24"
  availability_zone = "us-east-1d"
  
  tags = {
    Name = "1d_1"
    Owner = "Rich"
    Location = "us-east-1d"
  }
  }
  resource "aws_subnet" "pub5" {
  vpc_id     = aws_vpc.VPC_1.id
  cidr_block = "10.0.50.0/24"
  availability_zone = "us-east-1e"
  
  tags = {
   
    Name = "1e_1"
    Owner = "Rich"
    Location = "us-east-1e"
  }
  }
  
  resource "aws_subnet" "pub6" {
  vpc_id     = aws_vpc.VPC_1.id
  cidr_block = "10.0.40.0/24"
  availability_zone = "us-east-1f"
  
  tags = {
    Name = "1f_1"
    Owner = "Rich"
    Location = "us-east-1f"
  }

  }

  ############  Private VPC 7 subnets ###############

  resource "aws_vpc" "VPC_2" {
  cidr_block       = "10.20.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "VPC_2"
  }
  }
  resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.VPC_2.id
  cidr_block = "10.20.90.0/24"
  availability_zone = "us-east-1a"
  
  tags = {
    Name = "private1"
    Owner = "Rich"
    Location = "us-east-1a"
  }
  }
  resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.VPC_2.id
  cidr_block = "10.20.80.0/24"
  availability_zone = "us-east-1b"
  
  tags = {
    Name = "private2"
    Owner = "Rich"
    Location = "us-east-1b"
  }
  }
  resource "aws_subnet" "private3" {
  vpc_id     = aws_vpc.VPC_2.id
  cidr_block = "10.20.70.0/24"
  availability_zone = "us-east-1c"
  
  tags = {
    Name = "private3"
    Owner = "Rich"
    Location = "us-east-1c"
  }
  }
  resource "aws_subnet" "private4" {
  vpc_id     = aws_vpc.VPC_2.id
  cidr_block = "10.20.60.0/24"
  availability_zone = "us-east-1d"
  
  tags = {
    Name = "private4"
    Owner = "Rich"
    Location = "us-east-1d"
  }
  }
  resource "aws_subnet" "private5" {
  vpc_id     = aws_vpc.VPC_2.id
  cidr_block = "10.20.50.0/24"
  availability_zone = "us-east-1e"
  
  tags = {
    Name = "private5"
    Owner = "Rich"
    Location = "us-east-1e"
  }
  }
  resource "aws_subnet" "private6" {
  vpc_id     = aws_vpc.VPC_2.id
  cidr_block = "10.20.40.0/24"
  availability_zone = "us-east-1f"
  
  tags = {
    Name = "private6"
    Owner = "Rich"
    Location = "us-east-1f"
  }
  }
  resource "aws_subnet" "private7" {
  vpc_id     = aws_vpc.VPC_2.id
  cidr_block = "10.20.30.0/24"
  availability_zone = "us-east-1a"
  
  tags = {
    Name = "private7"
    Owner = "Rich"
    Location = "us-east-1a"
  }
}

