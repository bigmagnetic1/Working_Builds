data "aws_caller_identity" "caller" {}

data "aws_region" "current" {}

# Build and push the Docker image to ECR
resource "null_resource" "build_and_push_image" {
    triggers = {
        timestamp = timestamp()
    }

    provisioner "local-exec" {
        interpreter = ["/bin/bash" , "-c"]
        command <<-EOF

        aws ecr get-login-password --region ${data.aws_region.current.name} --profile dev | docker login --username AWS --password-stdin ${data.aws_caller_identity.caller.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com

        docker build -t ${data.aws_caller_identity.caller.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com/${module.ecr_create_repo.repository_name}:latest ${path.module}

        docker push ${data.aws_caller_identity.caller.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com/${module.ecr_create_repo.repository_name}:latest
        EOF
    
    }
    depends_on = [module.ecr_create_repo.repository]
}