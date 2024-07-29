resource "aws_ecs_cluster" "joeCluster" {
  name = var.cluster_name
}