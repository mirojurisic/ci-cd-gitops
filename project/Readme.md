project/
├─ terraform/
│  ├─ main.tf          # EKS + VPC + ECR
│  ├─ iam.tf           # IAM roles for GitHub Actions
│  ├─ flux.tf          # Flux bootstrap
│  ├─ providers.tf     # AWS, Kubernetes, GitHub, Flux providers
│  ├─ variables.tf
│  ├─ outputs.tf
├─ clusters/my-eks/    # GitOps repo folder for Flux
│  ├─ flask-app.yaml
│  ├─ kustomization.yaml
│  ├─ image-repo.yaml
│  ├─ image-policy.yaml
│  ├─ image-update.yaml
├─ .github/workflows/
│  └─ docker-build.yml
├─ app.py
├─ requirements.txt
├─ Dockerfile
