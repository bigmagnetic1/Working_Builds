variable "azs" {
    description = "A list of availability zone names or id's in the region."
    type = list(string)
    default = []
}

variable "public_ip_launch" {
    description = "Whether to assign public IP's on launch."
    type = bool
    default = true
}

variable "infra_subnets" {
    description = "A list of infratructure subnets"
    type = list(string)
    default = []
}