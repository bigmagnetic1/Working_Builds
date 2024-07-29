resource "aws_security_group" "joe_ecs_sg" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = module.elb_vpc.default_vpc_id

  # ingress {
  #   description      = var.ingress_description
  #   from_port        = var.elb_ingress_port
  #   to_port          = var.elb_ingress_port
  #   protocol         = "tcp"
  #   cidr_blocks      = var.ingress_cidr_blocks
  # }

  # egress {
  #   from_port        = 0
  #   to_port          = 0
  #   protocol         = "-1"
  #   cidr_blocks      = ["0.0.0.0/0"]
  # }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  #type              = "ingress"
  security_group_id = aws_security_group.joe_ecs_sg.id
  cidr_ipv4         = var.ingress_cidr_blocks
  from_port         = var.elb_ingress_port
  ip_protocol       = "tcp"
  to_port           = var.elb_ingress_port
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  #type              = "egress"
  security_group_id = aws_security_group.joe_ecs_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  #from_port         = 0
  ip_protocol       = "-1" # semantically equivalent to all ports
  #to_port           = 0
}
