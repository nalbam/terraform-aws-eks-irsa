# main

resource "aws_iam_role" "irsa" {
  name = local.irsa_name

  assume_role_policy = data.aws_iam_policy_document.irsa.json

  tags = merge(
    var.tags,
    {
      "Name" = local.irsa_name
    },
  )
}

resource "aws_iam_policy" "irsa" {
  name        = local.irsa_name
  description = local.irsa_desc
  policy      = var.iam_policy
}

resource "aws_iam_role_policy_attachment" "irsa" {
  role       = aws_iam_role.irsa.name
  policy_arn = aws_iam_policy.irsa.arn

  depends_on = [
    aws_iam_role.irsa,
    aws_iam_policy.irsa,
  ]
}
