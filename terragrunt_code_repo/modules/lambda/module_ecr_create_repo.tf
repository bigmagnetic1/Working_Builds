module "ecr_create_repo" {
    source = "../ecr"

    name                       = var.lambda_function_name
    force_delete               = true

    ecr_repo_lifeccycle_policy = var.additional_policies != null ? jsonencode(
        {
            "rules"            = concat(
                local.parsed_default_policy["rules"],
                local.parsed_additional_policies["rules"]
            )
        }
    ) : file("${path.module}/default_lifecycle_policy.json")   
}