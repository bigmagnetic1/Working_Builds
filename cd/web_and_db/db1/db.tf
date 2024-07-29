resource "aws_instance" "db" {
  ami           = "ami-090fa75af13c156b4"
  instance_type = "t2.micro"
  #security_groups = [aws_security_group.InstanceSG.name]

  tags = {
    Name = "DB Server"
  }
}

output "PrivateIP" {
  value = aws_instance.db.private_ip

}