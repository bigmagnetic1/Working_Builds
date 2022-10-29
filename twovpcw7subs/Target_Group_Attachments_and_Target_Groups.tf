
##########  TARGET GROUP FOR INSTANCES IN VPC_1  #######################################################

resource "aws_lb_target_group" "VPC1targetgroup" {
  name        = "VPC1targetgroup"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.VPC_1.id
}


##########  TARGET GROUP ATTACHMENT FOR INSTANCES VPC_1  ################################################

resource "aws_lb_target_group_attachment" "firstAttachment" {
#  count            = length(aws_instance.instancesForVPC_1)
  target_group_arn = aws_lb_target_group.VPC1targetgroup.arn
  target_id        = aws_instance.pub-a.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "secondAttachment" {
#  count            = length(aws_instance.instancesForVPC_1)
  target_group_arn = aws_lb_target_group.VPC1targetgroup.arn
  target_id        = aws_instance.pub-b.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "thirdAttachment" {
#  count            = length(aws_instance.instancesForVPC_1)
  target_group_arn = aws_lb_target_group.VPC1targetgroup.arn
  target_id        = aws_instance.pub-c.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "fourthAttachment" {
#  count            = length(aws_instance.instancesForVPC_1)
  target_group_arn = aws_lb_target_group.VPC1targetgroup.arn
  target_id        = aws_instance.pub-d.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "fifthAttachment" {
#  count            = length(aws_instance.instancesForVPC_1)
  target_group_arn = aws_lb_target_group.VPC1targetgroup.arn
  target_id        = aws_instance.pub-e.id
  port             = 80
}


##########  TARGET GROUP FOR INSTANCES IN VPC_2 #######################################################

resource "aws_lb_target_group" "VPC2targetGroup" {
  name        = "VPC2targetGroup"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.VPC_2.id
}


##########  TARGET GROUP ATTACHMENT FOR INSTANCES IN VPC_2  ################################################

resource "aws_lb_target_group_attachment" "First_Attachment" {
#  count            = length(aws_instance.VPC_2)
  target_group_arn = aws_lb_target_group.VPC2targetGroup.arn
  target_id        = aws_instance.prvt1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "Second_Attachment" {
#  count            = length(aws_instance.VPC_2)
  target_group_arn = aws_lb_target_group.VPC2targetGroup.arn
  target_id        = aws_instance.prvt2.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "Third_Attachment" {
#  count            = length(aws_instance.VPC_2)
  target_group_arn = aws_lb_target_group.VPC2targetGroup.arn
  target_id        = aws_instance.prvt3.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "Fourth_Attachment" {
#  count            = length(aws_instance.VPC_2)
  target_group_arn = aws_lb_target_group.VPC2targetGroup.arn
  target_id        = aws_instance.prvt4.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "Fifth_Attachment" {
#  count            = length(aws_instance.VPC_2)
  target_group_arn = aws_lb_target_group.VPC2targetGroup.arn
  target_id        = aws_instance.prvt5.id
  port             = 80
}