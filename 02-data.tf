# data

data "aws_caller_identity" "current" {
}

data "aws_iam_policy_document" "irsa" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type = "Federated"
      identifiers = [
        "arn:aws:iam::${local.account_id}:oidc-provider/${var.provider_url}"
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "${var.provider_url}:sub"
      values   = local.service_account_arns
    }
  }
}
