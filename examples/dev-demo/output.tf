# output

output "name" {
  value = module.irsa.name
}

output "arn" {
  value = module.irsa.arn
}

output "provider_arns" {
  value = module.irsa.provider_arns
}

output "provider_urns" {
  value = module.irsa.provider_urns
}
