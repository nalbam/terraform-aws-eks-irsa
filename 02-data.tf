# data

data "aws_caller_identity" "current" {
}

data "aws_eks_cluster" "cluster" {
  count = length(local.cluster_names)

  name = local.cluster_names[count.index]
}

data "aws_iam_policy_document" "irsa" {
  dynamic "statement" {
    for_each = local.provider_urns
    content {
      effect = "Allow"

      actions = ["sts:AssumeRoleWithWebIdentity"]

      principals {
        type = "Federated"
        identifiers = [
          "arn:aws:iam::${local.account_id}:oidc-provider/${statement.value}"
        ]
      }

      condition {
        test     = "StringEquals"
        variable = "${statement.value}:sub"
        values   = local.service_account_arns
      }
    }
  }
}
