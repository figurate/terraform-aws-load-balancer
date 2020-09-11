## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| certificate\_arn | ARN of certificate to use for TLS traffic | `any` | n/a | yes |
| logging\_bucket | An S3 bucket used to store access logs | `any` | `null` | no |
| logging\_prefix | A prefix applied to access logs | `any` | `null` | no |
| name\_prefix | Name to associate with load balancer | `any` | n/a | yes |
| private\_zone | Name of private zone to create DNS alias | `any` | `null` | no |
| security\_groups | A list of security group ids to associate with the load balancer | `list` | `[]` | no |
| subnets | Subnets to deploy into | `any` | n/a | yes |
| vpc | Name of the VPC to deploy to | `any` | n/a | yes |

## Outputs

No output.

