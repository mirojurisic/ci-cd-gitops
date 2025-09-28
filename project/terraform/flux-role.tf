#sub condition restricts the role to the Flux service account in namespace flux-system.
# this role is for flux to assume
resource "aws_iam_role" "flux_irsa" {
  name = "flux-ecr-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = module.eks.oidc_provider_arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "${replace(module.eks.oidc_provider, "https://", "")}:sub" = "system:serviceaccount:flux-system:flux"
          }
        }
      }
    ]
  })
}
resource "aws_iam_policy" "flux_ecr_policy" {
  name = "FluxECRPolicy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ecr:DescribeImages",
          "ecr:GetAuthorizationToken",
          "ecr:BatchGetImage"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "flux_attach_policy" {
  role       = aws_iam_role.flux_irsa.name
  policy_arn = aws_iam_policy.flux_ecr_policy.arn
}
