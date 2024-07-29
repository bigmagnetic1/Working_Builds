variable "cluster_name" {
  description = "Name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
  type = string
}

variable "sg_name" {
  description = "(Optional) Name of the security group. If omitted, Terraform will assign a random, unique name."
  type = string
  default = null
}

variable "sg_description" {
  description = "(Optional) Security group description. Defaults to Managed by Terraform. Cannot be ''."
  type = string
  default = null
}

variable "ingress_description" {
  description = "(Optional) Description of this ingress rule."
  type = string
  default = "HTTP from VPC"
}

variable "elb_ingress_port" {
  description = "Port range"
  type = number
}

variable "ingress_cidr_blocks" {
  description = "List of CIDR blocks to allow in HTTP security group."
  type        = string
  default     = "0.0.0.0/0"
}

variable "service_name" {
  description = "Name of the service (up to 255 letters, numbers, hyphens, and underscores)"
  type = string
}

variable "task_count" {
  description = "(Optional) Number of instances of the task definition to place and keep running. Defaults to 0. Do not specify if using the DAEMON scheduling strategy."
  type        = number
}

variable "service_launch_type" {
  description = "(Optional) Launch type on which to run your service. The valid values are EC2, FARGATE, and EXTERNAL. Defaults to EC2. Conflicts with capacity_provider_strategy."
  type        = string
}

variable "health_check" {
  description = "(Optional) Seconds to ignore failing load balancer health checks on newly instantiated tasks."
  type        = number
  default     = 30
}

variable "public_ip" {
  description = "(Optional) Assign a public IP address to the ENI (Fargate launch type only). Valid values are true or false. Default false."
  type = bool
}

variable "container_name" {
  description = "Name of the container to associate with the load balancer (as it appears in a container definition)."
  type = string
}

variable "container_port" {
  description = "Port on the container to associate with the load balancer."
  type = number
}

variable "family_name" {
  description = "A unique name for the task definition."
  type = string
}

variable "compatibilities" {
  description = "(Optional) Set of launch types required by the task. The valid values are EC2 and FARGATE."
  type = list(string)
  default = ["FARGATE"]
}

variable "ecs_networking" {
  description = " (Optional) Docker networking mode to use for the containers in the task. Valid values are none, bridge, awsvpc, and host."
  type = string
  default = "awsvpc"
}

variable "task_cpu" {
  description = "Number of cpu units used by the task. If the requires_compatibilities is FARGATE this field is required."
  type = number
}

variable "task_memory" {
  description = "Amount (in MiB) of memory used by the task. If the requires_compatibilities is FARGATE this field is required."
  type = number
}

variable "definition_json" {
  description = "A list of valid container definitions provided as a single valid JSON document."
  type = string
}