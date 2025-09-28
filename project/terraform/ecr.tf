

# ECR Repository
resource "aws_ecr_repository" "flask_app" {
  name                 = format("%s-%s", var.ecr_repository_name, var.environment)
  force_delete         = true
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

# (Optional) Lifecycle policy to keep only last 10 images
resource "aws_ecr_lifecycle_policy" "flask_app_policy" {
  repository = aws_ecr_repository.flask_app.name

  policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Keep last 10 images",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": 10
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}
# ECR Repository
resource "aws_ecr_repository" "bitnami_kubectl" {
  name                 = "bitnami/kubectl"
  force_delete         = true
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
# (Optional) Lifecycle policy to keep only last 10 images
resource "aws_ecr_lifecycle_policy" "bitnami_kubectl_policy" {
  repository = aws_ecr_repository.bitnami_kubectl.name

  policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Keep last 10 images",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": 10
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}

# ECR Repository
resource "aws_ecr_repository" "amazon_cli" {
  name                 = "amazon/aws-cli"
  force_delete         = true
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
# (Optional) Lifecycle policy to keep only last 10 images
resource "aws_ecr_lifecycle_policy" "amazon_cli_policy" {
  repository = aws_ecr_repository.amazon_cli.name

  policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Keep last 10 images",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": 10
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}