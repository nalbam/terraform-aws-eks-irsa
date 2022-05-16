# irsa

locals {
  irsa = [
    {
      service_name    = "cluster-autoscaler"
      namespace       = "addon-cluster-autoscaler"
      service_account = "cluster-autoscaler"
      iam_policy      = file("policies/cluster-autoscaler.json")
    },
  ]
}

module "irsa" {
  source = "nalbam/eks-irsa/aws"
  version = "1.1.1"

  for_each = {
    for irsa in local.irsa :
    irsa.service_name => irsa
  }

  cluster_oidc_urls = [module.eks.cluster_oidc_url]

  cluster_name    = module.eks.cluster_name
  service_name    = each.key
  namespace       = try(each.value.namespace, null)
  service_account = try(each.value.service_account, null)
  iam_policy      = each.value.iam_policy
}

output "irsa" {
  value = values(module.irsa).*.role_arn
}
