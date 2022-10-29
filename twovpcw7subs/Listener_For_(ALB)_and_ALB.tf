
##########  ALB FOR VPC_1  #################################################
resource "aws_lb" "ALBforVPC1" {
  name               = "ALBforVPC1"
  internal           = false
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.VPC1ALBsg.id]

  #availability_zones = ["us-east-2a", "us-east-2b", "us-east-2c"]
  subnets            = ["${aws_subnet.pub1.id}", "${aws_subnet.pub2.id}", "${aws_subnet.pub3.id}"]

  enable_deletion_protection = false


  tags = {
    Name        = "ALBforVPC1"
    Environment = "prod"
  }
}


##########  LISTENER FOR INSTANCES IN VPC_1  #################################################

resource "aws_lb_listener" "VPC-1-listener" {
  load_balancer_arn = aws_lb.ALBforVPC1.arn
  port              = "80"
  protocol          = "HTTP"
#  ssl_policy        = "ELBSecurityPolicy-2016-08"
#  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.VPC1targetgroup.arn
  }
}


##########  ALB FOR VPC_2  #############################################################################

resource "aws_lb" "ALBforVPC2" {
  name               = "ALBforVPC2"
  internal           = false
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.VPC2ALBSG.id]

  #availability_zones = ["us-east-2a", "us-east-2b", "us-east-2c"]
  subnets            = ["${aws_subnet.private1.id}", "${aws_subnet.private2.id}", "${aws_subnet.private3.id}"]

  enable_deletion_protection = false


  tags = {
    Name        = "ALBforVPC2"
    Environment = "Test2"
  }
}


##########  LISTENER FOR INSTANCES IN SOUTH_AMERICA_VPC  ###########################################################

resource "aws_lb_listener" "VPC-2-listener" {
  load_balancer_arn = aws_lb.ALBforVPC2.arn
  port              = "80"
  protocol          = "HTTP"
#  ssl_policy        = "ELBSecurityPolicy-2016-08"
#  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.VPC2targetGroup.arn
  }
} 