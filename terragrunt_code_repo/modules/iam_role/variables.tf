variable "role_name" {
  description = "Name of the IAM role to be used"
  type        = string
}

variable "role_description" {
  description = "(Optional) Description of IAM role to be used"
  type        = string
  default     = null
}

variable "role_path" {
  description = "(Optional) Path of the IAM role to be used"
  type        = string
  default     = null
}

variable "role_principals" {
  description = "List of principal objects for assuming role (trust relationships)"
  type        = list(object({
    type        = string
    identifiers = list(string)
  }))
}