
# # Generate an SSH key for Flux
# resource "tls_private_key" "flux" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# # Add deploy key to GitHub repo
# resource "github_repository_deploy_key" "flux" {
#   title      = "flux-deploy-key"
#   repository = var.github_repo
#   key        = tls_private_key.flux.public_key_openssh
#   read_only  = false
# }

# # Store private key in Kubernetes secret
# resource "kubernetes_secret" "flux_git_key" {
#   metadata {
#     name      = "flux-system"
#     namespace = "flux-system"
#   }

#   data = {
#     identity = tls_private_key.flux.private_key_pem
#   }
# }