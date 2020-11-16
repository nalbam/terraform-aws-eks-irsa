# output

output "name" {
  value = var.name
}

output "arn" {
  value = format("arn:aws:iam::%s:role/%s", local.account_id, var.name)
}

output "provider_urns" {
  value = local.provider_urns
}

output "provider_arns" {
  value = local.provider_arns
}
