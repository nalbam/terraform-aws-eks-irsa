# output

output "role_name" {
  value = aws_iam_role.irsa.name
}

output "role_arn" {
  value = aws_iam_role.irsa.arn
}
