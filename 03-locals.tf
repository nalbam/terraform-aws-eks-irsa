# locals

locals {
  account_id = data.aws_caller_identity.current.account_id
}

locals {
  provider_url = data.aws_eks_cluster.cluster.0.identity.0.oidc.0.issuer
  provider_urn = replace(local.provider_url, "https://", "")

  provider_urns = [
    for item in data.aws_eks_cluster.cluster.*.identity.0.oidc.0.issuer :
    replace(item, "https://", "")
  ]

  # provider_arns = [
  #   for item in local.provider_urns :
  #   "arn:aws:iam::${local.account_id}:oidc-provider/${item}"
  # ]
}

locals {
  cluster_names = compact(concat(
    [var.cluster_name],
    var.cluster_names,
  ))

  service_account_arn = var.kube_namespace != "" ? var.kube_serviceaccount != "" ? "system:serviceaccount:${var.kube_namespace}:${var.kube_serviceaccount}" : "" : ""

  service_account_arns = compact(concat(
    [local.service_account_arn],
    var.service_account_arns,
  ))

  tags = {
    "KubernetesCluster"                         = var.cluster_name
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}
