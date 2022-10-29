############## Security Groups VPC_1 Instances 
#############
resource "aws_security_group" "VPC1InstanceSG" {
  name        = "VPC1InstanceSG"
  description = "Security_group_for_instances"
  vpc_id      = aws_vpc.VPC_1.id

  ingress {
    description      = "HTTP VPC2"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   ingress {
    description      = "HTTPS VPC2"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "VPC1InstanceSG"
  }
}

############## Security Groups VPC_2 Instances 
#############
resource "aws_security_group" "VPC2InstanceSG" {
  name        = "VPC2InstanceSG"
  description = "Security_group_for_instances"
  vpc_id      = aws_vpc.VPC_2.id

  ingress {
    description      = "HTTP VPC2"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   ingress {
    description      = "HTTPS VPC2"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "VPC2InstanceSG"
  }
}