module "ecs_tg" {
  source = "../load_balancer"

  tg_name               = "ecs-target-group"
  # subnets_list          = module.elb_vpc.default_private_subnet_ids
  health_check_interval = 120
}