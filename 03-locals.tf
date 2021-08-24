# locals

locals {
  account_id = data.aws_caller_identity.current.account_id
}

locals {
  namespace       = var.namespace != "" ? var.namespace : var.service_name
  service_account = var.service_account != "" ? var.service_account : var.service_name

  irsa_name = var.irsa_name != "" ? var.irsa_name : format("irsa--%s--%s", var.cluster_name, var.service_name)
  irsa_desc = var.irsa_desc != "" ? var.irsa_desc : "${local.irsa_name} policy"

  service_account_arns = [format("system:serviceaccount:%s:%s", local.namespace, local.service_account)]
}
