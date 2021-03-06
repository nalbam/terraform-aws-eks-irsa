# iam role

resource "aws_iam_role" "this" {
  name        = var.name
  path        = "/"
  description = "irsa iam_role for ${var.name}"

  # Maximum CLI/API session duration in seconds between 3600 and 43200"
  max_session_duration = 3600

  force_detach_policies = false
  permissions_boundary  = ""

  assume_role_policy = data.aws_iam_policy_document.this.json

  tags = merge(
    {
      "Name" = var.name
    },
    local.tags,
  )
}

data "aws_iam_policy_document" "this" {
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
