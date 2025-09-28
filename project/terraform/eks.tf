# 1. Create IAM role for EKS nodes
resource "aws_iam_role" "eks_node_role" {
  name = "eks-node-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# 2. Attach standard EKS node policies
resource "aws_iam_role_policy_attachment" "eks_worker_node" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "eks_cni" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "ecr_readonly" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_role_policy_attachment" "ecr_Pullonly" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPullOnly"
}
# Create VPC, subnets, and EKS cluster

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.3.1"

  name               = "demo-eks-v3"
  kubernetes_version = "1.31"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_cluster_creator_admin_permissions = true
  enable_irsa                              = true
  addons                                   = { vpc_cni = true }


  eks_managed_node_groups = {
    general-purpose = {
      desired_size    = 2
      min_size        = 1
      max_size        = 4
      instance_types  = ["t3.large"]
      node_group_name = "demo-nodes"
      # Attach IAM role if you define one separately
      node_role_arn = aws_iam_role.eks_node_role.arn

      node_repair_config = {
        enabled = true
      }
    }
  }
}


# Create VPC for EKS
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name = "flux-eks-vpc-v2"

  azs = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]

  cidr            = "10.1.0.0/21"
  private_subnets = ["10.1.0.0/24", "10.1.1.0/24", "10.1.2.0/24"]
  public_subnets  = ["10.1.3.0/24", "10.1.4.0/24", "10.1.5.0/24"]


  enable_nat_gateway = true
  single_nat_gateway = true
}
