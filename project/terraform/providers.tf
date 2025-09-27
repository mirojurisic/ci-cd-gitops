provider "aws" {
  region = var.aws_region
}

# provider "kubernetes" {
#   config_path = "~/.kube/config"
# }

# provider "flux" {
#   kubernetes {
#     config_path = "~/.kube/config"
#   }
#   git = {
#     url    = "ssh://git@github.com/my-org/my-repo.git" # replace with your repo
#     branch = "main"
#     # GitHub deploy key is handled below
#   }
# }

# provider "github" {
#   token = var.github_token
#   owner = var.github_org
# }
