variable "lb_name" {
    description = "Name of the LB. If not specified, Terraform will autogenerate a name beginning with tf-lb."
    type = string
    default = null
}

variable "internal_config" {
    description = "Is it internal or external? If true, the LB will be internal. Defaults to false."
    type = bool
    default = null
}

variable "ip_type" {
  description = "valueType of IP addresses used by the subnets for the load balancer. The possible values are ipv4 and dualstack."
  type = string
  default = "ipv4"
}

variable "lb_type" {
  description = "(Optional) Type of load balancer to create. Possible values are application, gateway, or network. The default value is application."
  type = string
  default = null
}

variable "security_groups_list" {
  description = "List of security group IDs to assign to the LB."
  type = list(string)
  default = null
}

# variable "subnets_list" {
#   description = "List of subnet IDs to attach to the LB."
#   type = list(string)
# }

variable "deletion_protection" {
  description = "(Optional) If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false."
  type = bool
  default = null
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

variable "vpc_id" {
  description = "(Optional) VPC ID. Defaults to the region's default VPC."
  type = string
  default = null
}

variable "ingress_description" {
  description = "(Optional) Description of this ingress rule."
  type = string
  default = "HTTP from VPC"
}

variable "alb_listener_port" {
  description = "Port range"
  type = number
  default = 80
}

variable "ingress_cidr_blocks" {
  description = "List of CIDR blocks to allow in HTTP security group."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "listener_protocol" {
  description = "(Optional) Protocol for connections from clients to the load balancer. For Application Load Balancers, valid values are HTTP and HTTPS, with a default of HTTP. For Network Load Balancers, valid values are TCP, TLS, UDP, and TCP_UDP."
  type = string
  default = "HTTP"
}

variable "listener_action" {
  description = "Type of routing action. Valid values are forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc."
  type = string
  default = "forward"
}

variable "tg_name" {
  description = "(Optional) Name of the target group. If omitted, Terraform will assign a random, unique name. Only alphanumeric characters and hyphens allowed in name"
  type = string
  default = null
}

variable "tg_port" {
  description = "Port on which targets receive traffic, unless overridden when registering a specific target. Required when target_type is instance, ip or alb. Does not apply when target_type is lambda."
  type = number
  default = 80
}

variable "tg_protocol" {
  description = "Protocol to use for routing traffic to the targets. Should be one of GENEVE, HTTP, HTTPS, TCP, TCP_UDP, TLS, or UDP. Required when target_type is instance, ip, or alb. Does not apply when target_type is lambda."
  type = string
  default = "HTTP"
}

variable "elb_target_type" {
  description = "Type of target that you must specify when registering targets with this target group."
  type = string
  default = "ip"
}

variable "health_check_interval" {
  description = "(Optional) Approximate amount of time, in seconds, between health checks of an individual target. The range is 5-300. Defaults to 30."
  type = number
  default = null
}
