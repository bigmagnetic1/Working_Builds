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
  #user_data       = file("server-script.sh")

  depends_on = [aws_instance.db]

  tags = {
    Name = "Web Server"
  }
}
################ ADDED USER DATA EXAMPLE ABOVE ######################

resource "aws_eip" "web_ip" {
  instance = aws_instance.web.id

}


output "PrivateIP" {
  value = aws_instance.db.private_ip

}





