########## Public Subnets ##################
  
  resource "aws_subnet" "pub1" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.90.0/24"
  availability_zone = "us-east-1a"
  
  tags = {
    Name = "????"
    Owner = "????"
    Location = "us-east-1a"
  }
  }
