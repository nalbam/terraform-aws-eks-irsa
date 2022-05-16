# data

data "aws_caller_identity" "current" {
}

data "aws_iam_policy_document" "irsa" {
  dynamic "statement" {
    for_each = var.cluster_oidc_urls
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
        values = [
          format("system:serviceaccount:%s:%s", local.namespace, local.service_account)
        ]
      }
    }
  }
}
