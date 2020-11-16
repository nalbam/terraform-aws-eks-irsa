# data

data "aws_caller_identity" "current" {
}

data "aws_eks_cluster" "cluster" {
  count = length(local.cluster_names)

  name = local.cluster_names[count.index]
}
