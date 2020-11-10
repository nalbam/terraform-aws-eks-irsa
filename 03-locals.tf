# locals

locals {
  account_id = data.aws_caller_identity.current.account_id
}

locals {
  provider_url = data.aws_eks_cluster.cluster.identity.0.oidc.0.issuer
  provider_urn = replace(local.provider_url, "https://", "")
}

locals {
  service_account_arn = var.kube_namespace != "" ? var.kube_serviceaccount != "" ? "system:serviceaccount:${var.kube_namespace}:${var.kube_serviceaccount}" : "" : ""

  service_account_arns = concat(
    [local.service_account_arn],
    var.service_account_arns,
  )

  tags = {
    "KubernetesCluster"                         = var.cluster_name
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}
