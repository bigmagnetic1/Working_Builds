output "cluster_name" {
    value = aws_ecs_cluster.joeCluster.name
}

output "service_name" {
    value = aws_ecs_service.service.name
}