module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.26.6"

  cluster_name    = local.cluster_name
  cluster_version = "1.22"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  node_security_group_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = null
  }

  eks_managed_node_group_defaults = {
    ami_type                              = "AL2_x86_64"
    attach_cluster_primary_security_group = true
    create_security_group                 = false
    vpc_security_group_ids                = [aws_security_group.node_group_sec.id]
  }

  eks_managed_node_groups = {
    "${local.cluster_name}-NodeGroup" = {
      name           = "ClusterNodes"
      instance_types = ["t3.small"]
      min_size       = 3
      max_size       = 4
      desired_size   = 3
    }
  }
}
