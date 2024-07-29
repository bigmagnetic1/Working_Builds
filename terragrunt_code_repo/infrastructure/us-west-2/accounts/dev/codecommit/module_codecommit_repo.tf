module "my_repo" {
    source = "../../../../../modules/codecommit"
    
    repo_name = "catPipeline-CodeCommit2"
    description = "This time, we're doing it with Terraform!"
}