# AWS Region
variable "aws_region" {
    description = "Region where my resources will deploy"
    type = string
    default = "us-east-1"

}

# AWS EC2 Instance Type
variable "instance_type" {
description = "AWS EC2 Instance Type"
type = string 
default = "t3.micro"
}  

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
    description = "AWS EC2 Key pair associated with EC2"
    type = string
    default = "SAarchkeypair"
  
}

# AWS EC2 Instance Type - List
variable "instance_type_list" {
    description = "instance_type"
    type = list(string)
    default = ["t3.micro", "t3.small", "t3.large"] 
    #count.index 0=micro,1=small,2=large
  
}

# AWS EC2 Instance Type - Map
variable "instance_type_map" {
    description = "instance_type"
    type = map(string)
    default = {
        "dev" = "t3.micro"
        "qa" = "t3. small"
        "prod" = "t3.large"
    }
  
}