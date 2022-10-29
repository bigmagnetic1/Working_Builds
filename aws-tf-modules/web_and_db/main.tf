##### THIS BUILD SHOWS HOW TO INPUT AND REFER TO A FILE FOR RUNNING USERDATA ##
provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

module "db" {
  source = "./db"
}

module "web" {
  source = "./web"
}

output "PrivateIP" {
  value = module.db.PrivateIP

}

output "PublicIP" {
  value = module.web.pub_ip
}