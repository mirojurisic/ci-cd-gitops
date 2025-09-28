provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = ">= 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.13" # Must match EKS module requirements
    }
  }
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
