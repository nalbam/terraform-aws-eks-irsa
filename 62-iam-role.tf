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
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRoleWithWebIdentity"]

    # principals {
    #   type = "Federated"
    #   identifiers = [
    #     "arn:aws:iam::${local.account_id}:oidc-provider/${local.provider_urn}"
    #   ]
    # }

    dynamic "principals" {
      for_each = local.provider_arns
      content {
        type        = "Federated"
        identifiers = [principals.value]
      }
    }

    # condition {
    #   test     = "StringEquals"
    #   variable = "${local.provider_urn}:sub"
    #   values   = local.service_account_arns
    # }

    dynamic "condition" {
      for_each = local.provider_urns
      content {
        test     = "StringEquals"
        variable = "${condition.value}:sub"
        values   = local.service_account_arns
      }
    }
  }
}
