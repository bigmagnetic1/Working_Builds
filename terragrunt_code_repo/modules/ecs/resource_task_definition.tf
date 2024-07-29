resource "aws_ecs_task_definition" "service" {
  family                   = var.family_name
  requires_compatibilities = var.compatibilities
  network_mode             = var.ecs_networking
  execution_role_arn       = module.ecs_task_execution_role.role_arn
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  container_definitions    = var.definition_json
}