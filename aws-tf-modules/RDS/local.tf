###  this declares my Json data
###  "db_creds" is an example of the encrypted user/password created in the console in the secrets manager/parameter store ## 
#locals {
#  db_creds = jsondecode(
#    data.aws_secretsmanager_secret_version.db_creds.secret_string


#  )
#}