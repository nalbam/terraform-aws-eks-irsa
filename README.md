# terraform-aws-eks-irsa

<!--- BEGIN_TF_DOCS --->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_name | Name of the cluster, e.g: eks-demo | `string` | `""` | no |
| cluster\_names | n/a | `list(string)` | `[]` | no |
| kube\_namespace | n/a | `string` | `""` | no |
| kube\_serviceaccount | n/a | `string` | `""` | no |
| name | Name of the role, e.g: eks-demo-role | `any` | n/a | yes |
| policy\_arns | n/a | `list(string)` | `[]` | no |
| policy\_document | n/a | `string` | `""` | no |
| region | The region to deploy the cluster in, e.g: us-east-1 | `any` | n/a | yes |
| service\_account\_arns | n/a | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | n/a |
| name | n/a |

<!--- END_TF_DOCS --->
