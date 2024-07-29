resource "aws_lb" "joeELB" {
  name               = var.lb_name
  internal           = var.internal_config
  ip_address_type    = var.ip_type
  load_balancer_type = var.lb_type
  security_groups    = [
    aws_default_security_group.default_sg.id,
    aws_security_group.joe_lb_sg.id
  ]
  #availability_zones = ["us-east-2a", "us-east-2b", "us-east-2c"]
  subnets            = [
      module.elb_vpc.default_subnet_1,
      module.elb_vpc.default_subnet_2,
      module.elb_vpc.default_subnet_3,
      module.elb_vpc.default_subnet_4
  ]
  enable_deletion_protection = var.deletion_protection
}