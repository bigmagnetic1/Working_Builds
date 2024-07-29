##########  TARGET GROUP FOR INSTANCES IN VPC_1  #######################################################

resource "aws_lb_target_group" "VPC1targetgroup" {
  name        = "VPC1targetgroup"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.VPC_1.id
}

