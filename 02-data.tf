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
          format("arn:aws:iam::%s:oidc-provider/%s", local.account_id, statement.value)
        ]
      }

      condition {
        test     = "StringEquals"
        variable = format("%s:sub", statement.value)
        values   = local.service_account_arns
      }
    }
  }
}
