resource "aws_lb_target_group" "joe_tg" {
  name        = var.tg_name
  port        = var.tg_port
  protocol    = var.tg_protocol
  target_type = var.elb_target_type
  vpc_id      = module.elb_vpc.default_vpc_id

  health_check {
    matcher = "200,301,302"
    path    = "/"
    interval = var.health_check_interval
    timeout = 30
  }
}