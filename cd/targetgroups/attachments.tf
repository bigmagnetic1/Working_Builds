resource "aws_lb_target_group_attachment" "fourthAttachment" {
#  count            = length(aws_instance.instancesForVPC_1)
  target_group_arn = aws_lb_target_group.VPC1targetgroup.arn
  target_id        = aws_instance.pub-d.id
  port             = 80
}