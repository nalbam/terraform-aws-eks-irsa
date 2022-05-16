# locals

locals {
  account_id = data.aws_caller_identity.current.account_id
}

locals {
  name = var.irsa_name != null ? var.irsa_name : format("irsa--%s--%s", var.cluster_name, var.service_name)

  namespace       = var.namespace != null ? var.namespace : var.service_name
  service_account = var.service_account != null ? var.service_account : var.service_name

  iam_policy_desc = var.iam_policy_desc != null ? var.iam_policy_desc : format("%s policy", local.name)
}
