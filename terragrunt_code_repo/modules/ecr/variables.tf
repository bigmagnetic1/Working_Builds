variable "repo_name" {
  description = "This is the ECR repo name"
  type        = string
}

variable "image_tag_mutability" {
  description = "(Optional) The tag mutability setting for the repository. Must be one of: 'MUTABLE' or 'IMMUTABLE'"
  type        = string
  default     = "MUTABLE"
}

variable "force_delete" {
  description = "(Optional) If true, will delete the repository even if it contains images. Defaults to 'false'"
  type        = bool
  default     = false
}

variable "scan_on_push" {
  description = "(Optional) Indicates whether images are scanned after being pushed to the repository. Defaults to false."
  type        = bool
  default     = false
}

variable "ecr_repo_lifecycle_policy" {
  description = "(Optional) A JSON formatted ECR lifecycle policy to automate the cleaning up of unsused images."
  type        = string
  default     = null
}