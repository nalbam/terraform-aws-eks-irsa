# terraform-aws-eks-irsa

[![build](https://img.shields.io/github/workflow/status/nalbam/terraform-aws-eks-irsa/build?label=build&style=for-the-badge&logo=github)](https://github.com/nalbam/terraform-aws-eks-irsa/actions/workflows/push.yaml)
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
| cluster\_group | n/a | `string` | `null` | no |
| cluster\_name | n/a | `string` | `null` | no |
| cluster\_names | n/a | `list(string)` | `null` | no |
| iam\_policy | Required | `string` | n/a | yes |
| iam\_policy\_desc | n/a | `string` | `""` | no |
| irsa\_name | n/a | `string` | `null` | no |
| namespace | n/a | `string` | `""` | no |
| service\_account | n/a | `string` | `""` | no |
| service\_name | Required | `string` | n/a | yes |
| tags | n/a | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| role\_arn | n/a |
| role\_name | n/a |

<!--- END_TF_DOCS --->
