# locals

locals {
  account_id = data.aws_caller_identity.current.account_id
}

locals {
  cluster_group = try(var.cluster_info.cluster_group, var.cluster_name)
  cluster_names = try(var.cluster_info.cluster_names, [local.cluster_group])

  name = var.irsa_name != null ? var.irsa_name : format("irsa--%s--%s", local.cluster_group, var.service_name)

  namespace       = var.namespace != "" ? var.namespace : var.service_name
  service_account = var.service_account != "" ? var.service_account : var.service_name

  service_account_arns = [format("system:serviceaccount:%s:%s", local.namespace, local.service_account)]

  iam_policy_desc = var.iam_policy_desc != "" ? var.iam_policy_desc : "${local.name} policy"
}

locals {
  provider_urns = [
    for item in data.aws_eks_cluster.cluster.*.identity.0.oidc.0.issuer :
    replace(item, "https://", "")
  ]
}
