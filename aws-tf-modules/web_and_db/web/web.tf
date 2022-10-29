###### ADDED USER DATA EXAMPLE "user_data = file ("blah blah.sh")" BELOW ###########
resource "aws_instance" "web" {
  ami             = "ami-090fa75af13c156b4"
  instance_type   = "t2.micro"
  security_groups = [module.sg.sg_name]
  user_data       = file("./web/server-script.sh")

  tags = {
    Name = "Web Server"
  }
}

output "pub_ip" {
  value = module.eip.PublicIP
}

module "eip" {
  source = "../eip"
  instance_id = aws_instance.web.id
}

module "sg" {
  source = "../sg"
}

#### ADDED "USER DATA" EXAMPLE ABOVE. IT REFERENCES THE FILE PATH #########
