# Here is the terraform configuration file with user_data field

# Before using the script. please make sure you update the following 
# elements on the script.

# aws region
# aws profile ( if removed default would be taken)
# changing the prefix default value to what you desire
# change the ami ID
# instance_type
# count ( no of instances to launch)
# security group id
# user_data ( replace it with whatever commands or script you want to 
# execute)
# subnet_id

# provider "aws" {
 # region = "us-east-1"
 # profile = "dev"
# }

variable "prefix" {
  description = "servername prefix"
  default = "00000"
}

resource "aws_instance" "web" {
  ami           = "ami-0000"
  instance_type = "t2.micro"
  count = 1
  vpc_security_group_ids = [
    "sg-00000id"
  ]
  user_data = <<EOF
#!/bin/bash
sudo yum update
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Hello from Terraform</h1>" | sudo tee /var/www/html/index.html

# is this needed??? > /etc/hostname



EOF
  subnet_id = "${aws_subnet.pub1.id}"
  tags = {
    Name = "${var.prefix}${count.index}"
  }
}

output "instances" {
  value       = "${aws_instance.web.*.private_ip}"
  description = "PrivateIP address details"
}