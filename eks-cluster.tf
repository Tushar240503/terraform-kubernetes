
provider "kubernetes" {
  host = data.aws_eks_cluster.my-cluster.endpoint
  token = data.aws_eks_cluster_auth.my-cluster.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.my-cluster.certificate_authority.0.data)
}

data "aws_eks_cluster" "my-cluster" {
  name = module.eks.cluster_id  
}

data "aws_eks_cluster_auth" "my-cluster" {
  name = module.eks.cluster_id  
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.17.2"

  cluster_name = "myapp-eks"  
  cluster_version = "1.22"

  subnet_ids = module.myapp-vpc.private_subnets
  vpc_id = module.myapp-vpc.vpc_id

  tags = {
    environment = "development"
    application = "myapp"
  }

  eks_managed_node_groups = {
    dev = {
      min_size     = 1
      max_size     = 3
      desired_size = 3

      instance_types = ["t2.small"]
    }
  }
}




