############## Security Groups VPC_1 Instances 
#############
resource "aws_security_group" "Instance_SG" {
  name        = "Instance_SG"
  description = "Security_group_for_instances"
  vpc_id      = aws_vpc.vpc-03f80d508570a6397.id

  ingress {
    description      = "HTTP test-sg"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   ingress {
    description      = "HTTPS test-sg"
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
    Name = "Instance_SG"
  }
}