output "github_actions_role_arn" {
  value = aws_iam_role.github_actions_role.arn
}

output "ecr_repository_url" {
  value = aws_ecr_repository.flask_app.repository_url
}
output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}
# Output OIDC provider ARN
output "oidc_provider_arn" {
  value = module.eks.oidc_provider_arn
}

# Output OIDC provider URL
output "oidc_provider" {
  value = module.eks.oidc_provider
}

# output "cluster_ca_certificate" {
#   value = module.eks.cluster_certificate_authority_data
# }

# output "cluster_oidc_issuer_url" {
#   value = module.eks.cluster_oidc_issuer_url
# }
