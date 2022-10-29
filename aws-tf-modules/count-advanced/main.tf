provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

module "db" {
  source = "./db"
  server_names = ["mariadb","Mysql","mssql"]

}

output "private_ips" {
  value = module.db.PrivateIP
}