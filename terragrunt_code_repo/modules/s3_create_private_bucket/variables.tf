variable "bucket_name" {
  description = "(Optional) Name of the bucket. If omitted, Terraform will assign a random, unique name. Must be lowercase and less than or equal to 63 characters in length."
  type = string
  default = null
}

variable "additional_bucket_permissions" {
  description = "(Optional) Additional bucket permissions in JSON to be appended to the bucket policy."
  type = string
  default = null
}

variable "destroy_objects" {
  description = "(Optional) Boolean that indicates all objects (including any locked objects) should be deleted from the bucket when the bucket is destroyed so that the bucket can be destroyed without error. These objects are not recoverable."
  type = bool
  default = true
}