# locals

locals {
  account_id = data.aws_caller_identity.current.account_id
}

locals {
  provider_url = data.aws_eks_cluster.cluster.identity.0.oidc.0.issuer
  provider_urn = replace(local.provider_url, "https://", "")
}

locals {
  tags = {
    "KubernetesCluster"                         = var.cluster_name
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}
