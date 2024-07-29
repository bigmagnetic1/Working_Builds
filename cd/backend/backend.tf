terraform {
  backend "s3" {
    ### key is the path to the file you wil create in the logs bucket, or a bucket created to store our tfstate files. i.e, "terraform/new-name|build name|logs buckets name.tfstate" ###
    key = "terraform/tf-state-files.tfstate"
    bucket = "remote-backend-tf-2022"
    region = "us-east-1"
    access_key = ""
    secret_key = ""

  }
}