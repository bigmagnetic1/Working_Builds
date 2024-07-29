resource "aws_instance" "ec2" {
  ami           = "ami-090fa75af13c156b4"
  instance_type = "t2.micro"
  #security_groups = [aws_security_group.InstanceSG.name]

  tags = {
    Name = "tf-ec2"
  }
}