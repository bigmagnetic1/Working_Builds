# -------------------------------------------------
# PLATFORM TERRAGRUNT CONFIGURATION
# -------------------------------------------------

locals {
    # Gets the name of the directory of the platform
    cost_center    = "${reverse(split("/", get_path_from_repo_root()))[0]}"
    platform_name  = "${reverse(split("/", get_path_from_repo_root()))[0]}"
    resource_owner = "mauvais7k@gmail.com"
}