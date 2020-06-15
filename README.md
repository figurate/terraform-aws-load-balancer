# ![AWS](aws-logo.png) Load Balancer

Purpose: Blueprints for AWS Load Balancers.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| certificate\_arn | ARN of certificate to use for TLS traffic | `any` | `null` | no |
| name | Name to associate with load balancer | `any` | n/a | yes |
| port | Load balancer ingress port | `number` | n/a | yes |
| private\_zone | Name of private zone to create DNS alias | `any` | n/a | yes |
| protocol | Load balance ingress protocol | `any` | n/a | yes |
| subnets | Subnets to deploy into | `any` | n/a | yes |
| target\_port | Target group ingress port | `number` | n/a | yes |
| target\_protocol | Target group ingress protocol | `any` | n/a | yes |
| vpc | Name of the VPC to deploy to | `any` | n/a | yes |

## Outputs

No output.

