### create user/password in secrets manager and refer this variable to it ###

#data "aws_secretsmanager_secret_version" "db_creds" {
#  # Fill in the name you gave to your secret
#  secret_id = "db_creds"
#}