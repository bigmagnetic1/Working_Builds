
########## Security Groups VPC_1  Instances/ ALB #########################
########## Security Groups VPC_2  Instances/ ALB #########################

# Security Group for instances




  ######## ALB Security Group (VPC_2-ALB-SG)

  resource "aws_security_group" "VPC2ALBSG" {
  name        = "VPC_2_ALB_SG"
  description = "Security_group_for_instances"
  vpc_id      = aws_vpc.VPC_2.id

  ingress {
    description      = "HTTP from VPC_2"
    from_port        = 80
    to_port          = 80
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
    Name = "VPC_2_ALB_SG"
  }
  }


  ##### ALB Security Group (VPC_1-ALB-SG) ########

resource "aws_security_group" "VPC1ALBsg" {
  name        = "VPC_1_ALB_sg"
  description = "Security_group_for_ALB"
  vpc_id      = aws_vpc.VPC_1.id

  ingress {
    description      = "HTTP for VPC_1_ALB_sg"
    from_port        = 80
    to_port          = 80
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
    Name = "VPC_1_ALB_sg"
  }
  }
  
  ############## 5 Instances (Pub A-E) ###################
 

  resource "aws_instance" "pub-a" {
  ami           = "ami-0cff7528ff583bf9a"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.pub1.id}"
  vpc_security_group_ids = [ "${aws_security_group.VPC1InstanceSG.id}" ]
  

  tags = {
    Name = "pub-a"
  }
  }
  resource "aws_instance" "pub-b" {
  ami           = "ami-0cff7528ff583bf9a"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.pub1.id}"
  vpc_security_group_ids = [ "${aws_security_group.VPC1InstanceSG.id}" ]
  

  tags = {
    Name = "pub-b"
  }
  }
  resource "aws_instance" "pub-c" {
  ami           = "ami-0cff7528ff583bf9a"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.pub1.id}"
  vpc_security_group_ids = [ "${aws_security_group.VPC1InstanceSG.id}" ]
  

  tags = {
    Name = "pub-c"
  }
  }
  resource "aws_instance" "pub-d" {
  ami           = "ami-0cff7528ff583bf9a"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.pub1.id}"
  vpc_security_group_ids = [ "${aws_security_group.VPC1InstanceSG.id}" ]
  

  tags = {
    Name = "pub-d"
  }
  }
  resource "aws_instance" "pub-e" {
  ami           = "ami-0cff7528ff583bf9a"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.pub1.id}"
  vpc_security_group_ids = [ "${aws_security_group.VPC1InstanceSG.id}" ]
  

  tags = {
    Name = "pub-e"
  }
}

############## 5  Private Instances (1-5) ###################

resource "aws_instance" "prvt1" {
  ami           = "ami-0cff7528ff583bf9a"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.private1.id}"
  vpc_security_group_ids = [ "${aws_security_group.VPC2InstanceSG.id}" ]
  

  tags = {
    Name = "prvt1"
  }
}
resource "aws_instance" "prvt2" {
  ami           = "ami-0cff7528ff583bf9a"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.private1.id}"
  vpc_security_group_ids = [ "${aws_security_group.VPC2InstanceSG.id}" ]
  

  tags = {
    Name = "prvt2"
  }
}
  resource "aws_instance" "prvt3" {
  ami           = "ami-0cff7528ff583bf9a"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.private1.id}"
  vpc_security_group_ids = [ "${aws_security_group.VPC2InstanceSG.id}" ]
  

  tags = {
    Name = "prvt3"
  }
}
  resource "aws_instance" "prvt4" {
  ami           = "ami-0cff7528ff583bf9a"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.private1.id}"
  vpc_security_group_ids = [ "${aws_security_group.VPC2InstanceSG.id}" ]
  

  tags = {
    Name = "prvt4"
  }
}
  resource "aws_instance" "prvt5" {
  ami           = "ami-0cff7528ff583bf9a"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.private1.id}"
  vpc_security_group_ids = [ "${aws_security_group.VPC2InstanceSG.id}" ]
  

  tags = {
    Name = "prvt5"
  }
  

}