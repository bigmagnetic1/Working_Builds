module "cat_cluster" {
    source = "../../../../../../modules/ecs"

    cluster_name        = "catCluster"
    sg_name             = "sg_cat_cluster"
    sg_description      = "Security group that covers the ecs cluster."
    elb_ingress_port    = 80
    service_name        = "service"
    task_count          = 2
    service_launch_type = "FARGATE"
    public_ip           = true
    container_name      = "catpipeline"
    container_port      = 80

    family_name         = "linux"
    task_cpu            = 512
    task_memory         = 1024
    definition_json     = file("./cat_container.json")
}