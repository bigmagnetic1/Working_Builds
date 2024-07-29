module "cat_s3" {
    source = "../../../../../../modules/s3_create_private_bucket"

    bucket_name = "codepipeline-us-west-2-123456789"    
}
