# iam role

resource "aws_iam_role" "this" {
  name = var.name
  path = "/"

  # Maximum CLI/API session duration in seconds between 3600 and 43200"
  max_session_duration = 3600

  force_detach_policies = false
  permissions_boundary  = ""

  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

  tags = merge(
    {
      "Name" = var.name
    },
    local.tags,
  )
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type = "Federated"

      identifiers = [
        "arn:aws:iam::${local.account_id}:oidc-provider/${local.provider_urn}"
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.provider_urn}:sub"
      values   = ["system:serviceaccount:${var.kube_namespace}:${var.kube_serviceaccount}"]
    }
  }
}
