provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "aws_db_instance" "RDS" {
  allocated_storage = 10
  engine            = "mariadb"
  engine_version    = "10.6.8"
  instance_class    = "db.t3.micro"
  db_name           = "RDS"
  identifier        = "my-dsny-rds"
  # Set the secrets from secrets manager = the "db_creds" field. this is in the local.tf folder #
  #username             = local.db_creds.username
  #password             = local.db_creds.password
  username = "bob"
  password = "marley123"
  #parameter_group_name = "default.mysql5.7"
  skip_final_snapshot = true
  port                = 3306

}