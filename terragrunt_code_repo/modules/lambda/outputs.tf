output "default_policy" {
    description = "Default ECR lifecycle policy that gets added to the ECR repo upon creation."
    value = file("${path.module}/policy.json")
}

output "additional_policies" {
    description = "Extra ECR lifecycle policies"
    value       = var.additional_policies
}