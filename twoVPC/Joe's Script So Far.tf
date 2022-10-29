provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA23GIKPMKMCC3F75H"
  secret_key = "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"
}

####################################################################################################################
##########  SECURITY GROUP FOR THE ALB IN VPC NAMED MAUVAIS  #######################################################
####################################################################################################################
resource "aws_security_group" "RichALB" {
  name        = "forMauvaisALB"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.Rich_VPC.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTPS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "richALB"
    Environment = "Test"
  }
}

####################################################################################################################
##########  SECURITY GROUP FOR THE INSTANCES IN VPC NAMED MAUVAIS  #################################################
####################################################################################################################
resource "aws_security_group" "RichInstances" {
  name        = "RichInstances"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.Rich_VPC.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTPS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "forMauvaisInstances"
    Environment = "Test"
  }
}

####################################################################################################################
##########  SECURITY GROUP FOR ALB IN VPC NAMED BON  ###############################################################
####################################################################################################################
resource "aws_security_group" "forRichALB" {
  name        = "forRichALB"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.Rich_VPC.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTPS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "forRichALB"
    Environment = "Production"
  }
}

####################################################################################################################
##########  SECURITY GROUP FOR INSTANCES IN VPC NAMED BON  #########################################################
####################################################################################################################
resource "aws_security_group" "forRichInstances2" {
  name        = "forRichInstances2"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.Rich_VPC.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "http"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTPS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "forRichInstances2"
    Environment = "Production"
  }
}

####################################################################################################################
##########  TARGET GROUP FOR INSTANCES IN VPC NAMED BON  ###########################################################
####################################################################################################################
resource "aws_lb_target_group" "testTargetGroup1" {
  name     = "testTargetGroup1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.Rich_VPC.id
}


####################################################################################################################
##########  TARGET GROUP FOR INSTANCES IN VPC NAMED MAUVAIS  #######################################################
####################################################################################################################
resource "aws_lb_target_group" "testTargetGroup2" {
  name     = "testTargetGroup2"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.Rich_VPC.id
}

####################################################################################################################
##########  LISTENER FOR INSTANCES IN VPC NAMED MAUVAIS  ###########################################################
####################################################################################################################
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.testALB.arn
  port              = "80"
  protocol          = "HTTP"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.testTargetGroup2.arn
  }
}

####################################################################################################################
##########  LISTENER FOR INSTANCES IN VPC NAMED BON  ###############################################################
####################################################################################################################
resource "aws_lb_listener" "front_end2" {
  load_balancer_arn = aws_lb.prodALB.arn
  port              = "80"
  protocol          = "HTTP"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.testTargetGroup1.arn
  }
}

####################################################################################################################
##########  EC2 INSTANCES FOR VPC NAMED BON  #######################################################################
####################################################################################################################
#resource "aws_instance" "instance1ForBonVPC" {
# ami                    = "ami-0cff7528ff583bf9a"
#  instance_type          = "t2.micro"
#  vpc_security_group_ids = ["${aws_security_group.forBonInstances.id}"]
#  subnet_id              = aws_subnet.private_subnet1.id
#
#  tags = {
#    Name        = "instance1ForBonVPC"
#    Environment = "Production"
#  }
#}
resource "aws_instance" "instance2ForBonVPC" {
  ami                    = "ami-0cff7528ff583bf9a"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.forBonInstances.id}"]
  subnet_id              = aws_subnet.private_subnet1.id

  tags = {
    Name        = "instance2ForBonVPC"
    Environment = "Production"
  }
}
resource "aws_instance" "instance3ForBonVPC" {
  ami                    = "ami-0cff7528ff583bf9a"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.forBonInstances.id}"]
  subnet_id              = aws_subnet.private_subnet1.id

  tags = {
    Name        = "instance3ForBonVPC"
    Environment = "Production"
  }
}
resource "aws_instance" "instance4ForBonVPC" {
  ami                    = "ami-0cff7528ff583bf9a"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.forBonInstances.id}"]
  subnet_id              = aws_subnet.private_subnet1.id

  tags = {
    Name        = "instance4ForBonVPC"
    Environment = "Production"
  }
}
resource "aws_instance" "instance5ForBonVPC" {
  ami                    = "ami-0cff7528ff583bf9a"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.forBonInstances.id}"]
  subnet_id              = aws_subnet.private_subnet1.id

  tags = {
    Name        = "instance5ForBonVPC"
    Environment = "Production"
  }
}
resource "aws_ec2_availability_zone_group" "example1" {
  group_name    = "us-east-1-lax-1"
  opt_in_status = "opted-in"
}
####################################################################################################################
##########  EC2 INSTANCES FOR VPC NAMED MAUVAIS  ###################################################################
####################################################################################################################
resource "aws_instance" "instanceforrich" {

ami                    = "ami-0aeb7c931a5a61206"
instance_type          = "t2.micro"
vpc_security_group_ids = ["${aws_security_group.instanceforrich.id}"]
subnet_id              = aws_subnet.private_subnet-1.id

tags = {
  Name        = "instance1ForBonVPC"
  Environment = "Test"
 }
}

#resource "aws_instance" "instance2oFrMauvaisInstances" {
#  ami           = "ami-0cff7528ff583bf9a"
#  instance_type = "t2.micro"
#  vpc_security_group_ids = ["${aws_security_group.forMauvaisInstances.id}"]
#  subnet_id = "${aws_subnet.private_subnet-1.id}"

#  tags = {
#    Name        = "instance2ForBonVPC"
#    Environment = "Test"
#  }
#}
#resource "aws_instance" "instance3ForMauvaisInstances" {
#  ami           = "ami-0cff7528ff583bf9a"
#  instance_type = "t2.micro"
#  vpc_security_group_ids = ["${aws_security_group.forMauvaisInstances.id}"]
#  subnet_id = "${aws_subnet.private_subnet-1.id}"

#  tags = {
#    Name        = "instance3ForMauvaisVPC"
#    Environment = "Test"
#  }
#}
#resource "aws_instance" "instance4ForMauvaisInstances" {
#  ami                    = "ami-0cff7528ff583bf9a"
#  instance_type          = "t2.micro"
#  vpc_security_group_ids = ["${aws_security_group.forMauvaisInstances.id}"]
#  subnet_id = "${aws_subnet.private_subnet-1.id}"

#  tags = {
#    Name        = "instance4ForMauvaisVPC"
#    Environment = "Test"
#  }
#}
#resource "aws_instance" "instance5ForMauvaisInstances" {
#  ami                    = "ami-0cff7528ff583bf9a"
#  instance_type          = "t2.micro"
#  vpc_security_group_ids = ["${aws_security_group.forMauvaisInstances.id}"]
#  subnet_id              = "${aws_subnet.private_subnet-1.id}"

#  tags = {
#    Name        = "instance5ForMauvaisVPC"
#    Environment = "Test"
#  }
#}

####################################################################################################################
##########  ALB FOR VPC NAMED MAUVAIS  #############################################################################
####################################################################################################################
resource "aws_lb" "testALB" {
  name               = "testALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.forMauvaisALB.id]
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  subnets = aws_subnet.private_subnet-2.*.id

  enable_deletion_protection = false


  tags = {
    Name        = "testALB"
    Environment = "Test"
  }
}
  
# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}

# e.g., Create subnets in the first two available availability zones

resource "aws_subnet" "primary" {
  availability_zone = data.aws_availability_zones.available.names[0]

  # ...
}

resource "aws_subnet" "secondary" {
  availability_zone = data.aws_availability_zones.available.names[1]

  # ...
}


####################################################################################################################
##########  ALB FOR VPC NAMED BON  #################################################################################
####################################################################################################################
resource "aws_lb" "prodALB" {
  name               = "prodALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.forBonALB.id]
  #availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  subnets = [aws_subnet.private_subnet2.id,aws_subnet.private_subnet2.id]

  enable_deletion_protection = false


  tags = {
    Name        = "prodALB"
    Environment = "Production"
  }
}

####################################################################################################################
##########  VPC FOR TEST ENVIRONMENT NAMED MAUVAIS  ################################################################
####################################################################################################################
resource "aws_vpc" "Mauvais_VPC" {
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"
  #availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

  tags = {
    Name        = "Mauvais_VPC"
    Environment = "Test"
  }
}

####################################################################################################################
##########  VPC FOR PRODUCTION ENVIRONMENT NAMED BON  ##############################################################
####################################################################################################################
resource "aws_vpc" "Bon_VPC" {
  cidr_block       = "10.2.0.0/16"
  instance_tenancy = "default"
  #availability_zones = ["us-east-2a", "us-east-2b", "us-east-2c"]

  tags = {
    Name        = "Bon_VPC"
    Environment = "Production"
  }
}

####################################################################################################################
##########  SUBNETS FOR VPC NAMED MAUVAIS  #########################################################################
####################################################################################################################
resource "aws_subnet" "public_subnet-1" {
  vpc_id     = aws_vpc.Mauvais_VPC.id
  cidr_block = "10.1.1.0/24"

  tags = {
    Name        = "public_subnet-1"
    Owner       = "Joe Mauvais"
    Layer       = "Web Layer"
    Environment = "Test"
  }
}
resource "aws_subnet" "public_subnet-2" {
  vpc_id     = aws_vpc.Mauvais_VPC.id
  cidr_block = "10.1.2.0/24"

  tags = {
    Name        = "public_subnet-2"
    Owner       = "Joe Mauvais"
    Layer       = "Web Layer"
    Environment = "Test"
  }
}
resource "aws_subnet" "public_subnet-3" {
  vpc_id     = aws_vpc.Mauvais_VPC.id
  cidr_block = "10.1.3.0/24"

  tags = {
    Name        = "public_subnet-3"
    Owner       = "Joe Mauvais"
    Layer       = "Web Layer"
    Environment = "Test"
  }
}
resource "aws_subnet" "private_subnet-1" {
  vpc_id     = aws_vpc.Mauvais_VPC.id
  cidr_block = "10.1.4.0/24"

  tags = {
    Name        = "private_subnet-1"
    Owner       = "Joe Mauvais"
    Layer       = "Application Layer"
    Environment = "Test"
  }
}
resource "aws_subnet" "private_subnet-2" {
  vpc_id     = aws_vpc.Mauvais_VPC.id
  cidr_block = "10.1.5.0/24"

  tags = {
    Name        = "private_subnet-2"
    Owner       = "Joe Mauvais"
    Layer       = "Application Layer"
    Environment = "Test"
  }
}
resource "aws_subnet" "private_subnet-3" {
  vpc_id     = aws_vpc.Mauvais_VPC.id
  cidr_block = "10.1.6.0/24"

  tags = {
    Name        = "private_subnet-3"
    Owner       = "Joe Mauvais"
    Layer       = "Application Layer"
    Environment = "Test"
  }
}
resource "aws_subnet" "private_subnet-4" {
  vpc_id     = aws_vpc.Mauvais_VPC.id
  cidr_block = "10.1.7.0/24"

  tags = {
    Name        = "private_subnet-4"
    Owner       = "Joe Mauvais"
    Layer       = "Database Layer"
    Environment = "Test"
  }
}

####################################################################################################################
##########  SUBNETS FOR VPC NAMED BON  #############################################################################
####################################################################################################################
resource "aws_subnet" "public_subnet1" {
  vpc_id     = aws_vpc.Bon_VPC.id
  cidr_block = "10.2.1.0/24"

  tags = {
    Name        = "public_subnet1"
    Owner       = "Joe Mauvais"
    Layer       = "Web Layer"
    Environment = "Production"
  }
}
resource "aws_subnet" "public_subnet2" {
  vpc_id     = aws_vpc.Bon_VPC.id
  cidr_block = "10.2.2.0/24"

  tags = {
    Name        = "public_subnet2"
    Owner       = "Joe Mauvais"
    Layer       = "Web Layer"
    Environment = "Production"
  }
}
resource "aws_subnet" "public_subnet3" {
  vpc_id     = aws_vpc.Bon_VPC.id
  cidr_block = "10.2.3.0/24"

  tags = {
    Name        = "public_subnet3"
    Owner       = "Joe Mauvais"
    Layer       = "Web Layer"
    Environment = "Production"
  }
}
resource "aws_subnet" "private_subnet1" {
  vpc_id     = aws_vpc.Bon_VPC.id
  cidr_block = "10.2.4.0/24"

  tags = {
    Name        = "private_subnet1"
    Owner       = "Joe Mauvais"
    Layer       = "Application Layer"
    Environment = "Production"
  }
}
resource "aws_subnet" "private_subnet2" {
  vpc_id     = aws_vpc.Bon_VPC.id
  cidr_block = "10.2.5.0/24"

  tags = {
    Name        = "private_subnet2"
    Owner       = "Joe Mauvais"
    Layer       = "Application Layer"
    Environment = "Production"
  }
}
resource "aws_subnet" "private_subnet3" {
  vpc_id     = aws_vpc.Bon_VPC.id
  cidr_block = "10.2.6.0/24"

  tags = {
    Name        = "private_subnet3"
    Owner       = "Joe Mauvais"
    Layer       = "Application Layer"
    Environment = "Production"
  }
}
resource "aws_subnet" "private_subnet4" {
  vpc_id     = aws_vpc.Bon_VPC.id
  cidr_block = "10.2.7.0/24"

  tags = {
    Name        = "private_subnet4"
    Owner       = "Joe Mauvais"
    Layer       = "Database Layer"
    Environment = "Production"
  }
}