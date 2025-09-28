

# Set GitHub token as env variable for authentication
```
export GITHUB_TOKEN=<your-github-pat>
export GITHUB_USER=<your-github-username>
export GITHUB_REPOSITORY=<your-github-username>
```
# Bootstrap Flux on EKS
```
flux bootstrap github \
  --owner=$GITHUB_USER \
  --repository=$GITHUB_REPOSITORY  \
  --branch=main \
  --path=project/clusters/demo \
  --personal
```

Flux component are in flux-system name space
```
kubectl get pods -n flux-system
```
Reconcile immediatelly
```
flux reconcile kustomization flux-system --with-source
```

# Kubectl
```
aws eks --region eu-central-1 update-kubeconfig --name demo-eks-v2
kubectl config current-context
kubectl get nodes
```