# iam policy

resource "aws_iam_policy" "this" {
  count = var.policy_document != "" ? 1 : 0

  name        = var.name
  path        = "/"
  description = "irsa iam_policy for ${var.name}"
  policy      = var.policy_document
}

resource "aws_iam_role_policy_attachment" "this" {
  count = var.policy_document != "" ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this[0].arn
}

resource "aws_iam_role_policy_attachment" "arns" {
  count = length(var.policy_arns)

  role       = aws_iam_role.this.name
  policy_arn = var.policy_arns[count.index]
}
