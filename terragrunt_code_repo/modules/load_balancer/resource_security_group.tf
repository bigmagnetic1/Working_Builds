resource "aws_security_group" "joe_lb_sg" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = module.elb_vpc.default_vpc_id

  ingress {
    description      = var.ingress_description
    from_port        = var.alb_listener_port
    to_port          = var.alb_listener_port
    protocol         = "tcp"
    cidr_blocks      = var.ingress_cidr_blocks
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_default_security_group" "default_sg" {
  vpc_id = module.elb_vpc.default_vpc_id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}