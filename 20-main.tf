# main

resource "aws_iam_role" "irsa" {
  name = local.name

  assume_role_policy = data.aws_iam_policy_document.irsa.json

  tags = merge(
    var.tags,
    {
      "Name" = local.name
    },
  )
}

resource "aws_iam_policy" "irsa" {
  name        = local.name
  description = local.iam_policy_desc
  policy      = var.iam_policy
}

resource "aws_iam_role_policy_attachment" "irsa" {
  policy_arn = aws_iam_policy.irsa.arn
  role       = aws_iam_role.irsa.name

  depends_on = [
    aws_iam_policy.irsa,
    aws_iam_role.irsa
  ]
}
