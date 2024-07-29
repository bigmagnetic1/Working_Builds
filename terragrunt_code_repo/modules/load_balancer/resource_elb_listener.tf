resource "aws_lb_listener" "joe_front_end" {
  load_balancer_arn = aws_lb.joeELB.arn
  port              = var.alb_listener_port
  protocol          = var.listener_protocol
#  ssl_policy        = "ELBSecurityPolicy-2016-08"
#  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = var.listener_action
    target_group_arn = aws_lb_target_group.joe_tg.arn
  }
}