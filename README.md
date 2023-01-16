# terraform-aws-eks-irsa

[![build](https://img.shields.io/github/actions/workflow/status/nalbam/terraform-aws-eks-irsa/push.yml?branch=main&style=for-the-badge&logo=github)](https://github.com/nalbam/terraform-aws-eks-irsa/actions/workflows/push.yml)
[![release](https://img.shields.io/github/v/release/nalbam/terraform-aws-eks-irsa?style=for-the-badge&logo=github)](https://github.com/nalbam/terraform-aws-eks-irsa/releases)

<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.1 |
| aws | >= 4.1.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 4.1.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_name | n/a | `string` | `""` | no |
| cluster\_oidc\_urls | Required | `list(string)` | n/a | yes |
| iam\_policy | Required | `string` | n/a | yes |
| iam\_policy\_desc | n/a | `string` | `null` | no |
| irsa\_name | n/a | `string` | `null` | no |
| namespace | n/a | `string` | `null` | no |
| service\_account | n/a | `string` | `null` | no |
| service\_name | n/a | `string` | `""` | no |
| tags | n/a | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| role\_arn | n/a |
| role\_name | n/a |

<!--- END_TF_DOCS --->
