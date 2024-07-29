resource "aws_ecs_service" "service" {
  name                              = var.service_name
  cluster                           = aws_ecs_cluster.joeCluster.name
  task_definition                   = aws_ecs_task_definition.service.arn
  desired_count                     = var.task_count
  launch_type                       = var.service_launch_type
  health_check_grace_period_seconds = var.health_check

  network_configuration {
    security_groups = [aws_security_group.joe_ecs_sg.id]
    subnets         = [
      module.elb_vpc.default_subnet_1,
      module.elb_vpc.default_subnet_2,
      module.elb_vpc.default_subnet_3,
      module.elb_vpc.default_subnet_4
    ]
    assign_public_ip = var.public_ip
  }

  load_balancer {
    target_group_arn = module.ecs_tg.tg_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  lifecycle {
    create_before_destroy = true
  }
}