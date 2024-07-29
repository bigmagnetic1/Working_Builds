variable "lambda_function_name" {
    description = "A unique name for your lambda function"
    type        = string
}

variable "lambda_description" {
    description = "(Optional) Description of your lambda function (or layer)"
    type        = string
    default     = null
}

variable "additional_policies" {
    description = "(Optional) Any additional Lifecycle Policies for ECR added at the stack level."
    type        = string
    default     = null
}

variable "ecr_lifecycle_policy" {
    description = "Final ECR Lifecycle Policy"
    type        = string
    default     = null
}