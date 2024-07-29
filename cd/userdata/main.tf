##### THIS BUILD SHOWS HOW TO INPUT AND REFER TO A FILE FOR RUNNING USERDATA ##
provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}


resource "aws_instance" "db" {
  ami           = "ami-090fa75af13c156b4"
  instance_type = "t2.micro"
  #security_groups = [aws_security_group.InstanceSG.name]

  tags = {
    Name = "DB Server"
  }
}
####### ADDED USER DATA EXAMPLE "user_data = file ("blah blah.sh")" BELOW ###########
resource "aws_instance" "web" {
  ami             = "ami-090fa75af13c156b4"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.web_traffic.name]
  user_data       = file("server-script.sh")

  tags = {
    Name = "Web Server"
  }
}
################ ADDED USER DATA EXAMPLE ABOVE ######################

resource "aws_eip" "web_ip" {
  instance = aws_instance.web.id

}

variable "ingress" {
  type    = list(number)
  default = [80, 443]

}

variable "egress" {
  type    = list(number)
  default = [80, 443]

}

resource "aws_security_group" "web_traffic" {
  name = "Allow Web Traffic"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }


  dynamic "egress" {
    iterator = port
    for_each = var.egress
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

output "PrivateIP" {
  value = aws_instance.db.private_ip

}

output "PublicIP" {
  value = aws_eip.web_ip.private_ip
}