output "tg_arn" {
  description = "ARN of the Target Group."
  value = aws_lb_target_group.joe_tg.arn
}