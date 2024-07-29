provider "aws" {
 region     = "us-east-1"
  access_key = ""
  secret_key = "" 
  
}
#### Where will you get the module? ####
#### What is the module path? ####
#### the method is: "./(folder name)" below as "./ec2" ####
#### You may call the module whatever you want to ######

module "ec2module" {
  source = "./ec2"
  ec2name = "name from Module"
}

output "module_output" {
  value = module.ec2module.instance_id
}

