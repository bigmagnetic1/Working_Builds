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