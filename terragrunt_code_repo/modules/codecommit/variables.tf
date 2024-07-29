variable "repo_name" {
  description = "This is the CodeCommit repo name"
  type        = string
}

variable "description" {
  description = "This is the CodeCommit description"
  type = string
  default = null
}