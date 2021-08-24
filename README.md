# terraform-aws-eks-irsa

<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 3.30.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.30.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_name | n/a | `string` | n/a | yes |
| iam\_policy | n/a | `string` | n/a | yes |
| irsa\_desc | n/a | `string` | `""` | no |
| irsa\_name | n/a | `string` | `""` | no |
| namespace | n/a | `string` | `""` | no |
| provider\_url | n/a | `string` | n/a | yes |
| service\_account | n/a | `string` | `""` | no |
| service\_name | n/a | `string` | n/a | yes |
| tags | n/a | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| role\_arn | n/a |
| role\_name | n/a |

<!--- END_TF_DOCS --->
