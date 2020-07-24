# output

output "name" {
  value = var.name
}

output "arn" {
  value = format("arn:aws:iam::%s:role/%s", local.account_id, var.name)
}
