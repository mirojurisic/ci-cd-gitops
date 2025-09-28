1. Apply Terraform
```
terraform init
terraform apply -var-file="./env/int.tfvars"
terraform apply -auto-approve -var-file="./env/int.tfvars"

```

This will create:

VPC with private + public subnets

EKS control plane

Node group (t3.small instances, autoscaling between 1–3 nodes)

2. Connect to the Cluster

After apply, update your kubeconfig:
```
aws eks update-kubeconfig --region eu-central-1 --name demo-eks
```

Check connection:

kubectl get nodes


You should see your 2 worker nodes.