# variable "github_token" {
#   type        = string
#   description = "GitHub personal access token with repo permissions"
# }

variable "github_org" {
  type        = string
  description = "GitHub org or user"
}

variable "github_repo" {
  type        = string
  description = "GitHub repository name"
}


variable "ecr_repository_name" {
  type        = string
  description = "ECR repository name"
  default     = "flask-repo"
}
variable "environment" {
  type        = string
  description = "environment name"
}
variable "aws_region" {
  type        = string
  description = "aws region"
  default     = "eu-central-1"
}


