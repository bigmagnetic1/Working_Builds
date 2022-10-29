resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.20.90.0/24"
  availability_zone = "us-east-1a"
  
  tags = {
    Name = "private1"
    Owner = "Rich"
    Location = "us-east-1a"
  }
  }