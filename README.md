# terraform-aws-eks-irsa

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_name | Name of the cluster, e.g: eks-demo | `any` | n/a | yes |
| kube\_namespace | n/a | `any` | n/a | yes |
| kube\_serviceaccount | n/a | `any` | n/a | yes |
| name | Name of the role, e.g: eks-demo-role | `any` | n/a | yes |
| policy\_arns | n/a | `list(string)` | `[]` | no |
| policy\_document | n/a | `string` | `""` | no |
| region | The region to deploy the cluster in, e.g: us-east-1 | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | n/a |
| name | n/a |
