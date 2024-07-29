locals {
    ########################################
    # ECR Lifecycle Policy Logic
    ########################################

    # Parses the default Lifecycle policy and additional Lifecycle policies
    parsed_default_policy      = jsondecode(file("${path.module}/default_policy.json"))
    parsed_additional_policies = var.additional_policies != null ? jsondecode(var.additional_policies) : {}
}