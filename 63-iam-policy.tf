# iam policy

resource "aws_iam_policy" "this" {
  name        = var.name
  path        = "/"
  description = "irsa iam_policy for ${var.name}"
  policy      = var.policy_document
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}
