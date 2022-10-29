######## Security Groups for Instances created with DYNAMIC BLOCKS
#############

provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

#### to declare resources in existing VPC do not create a new VPC

variable "ingressrules" {
  type    = list(number)
  default = [80,443]
}

variable "egressrules" {
  type  = list(number)
  default = [80,443,25,3306,53,8080]
}

resource "aws_instance" "dynamic" {
  ami = "ami-090fa75af13c156b4"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.InstanceSG.name]
}



resource "aws_security_group" "InstanceSG" {
  name        = "InstanceSG"
  #description = "Security_group_for_instances"
  #vpc_id      = aws_vpc.id
  ### hash out the vpc id when you want to build in an existing VPC


dynamic "ingress" {
  #description = "HTTP"
  iterator = port
  for_each = var.ingressrules
  content {
  from_port   = port.value
  to_port     = port.value
  protocol    = "TCP"
  cidr_blocks = ["0.0.0.0/0"]
  }
}

dynamic "egress" {
    #description = "HTTP"
  iterator = port
  for_each = var.egressrules
  content {
  from_port   = port.value
  to_port     = port.value
  protocol    = "TCP"
  cidr_blocks = ["0.0.0.0/0"]
  }

}

  tags = {
  Name        = "dynamic_block"
  #description = "explain"
}

}