# ![AWS](aws-logo.png) Load Balancer

[![CI](https://github.com/figurate/terraform-aws-load-balancer/actions/workflows/main.yml/badge.svg)](https://github.com/figurate/terraform-aws-load-balancer/actions/workflows/main.yml)

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
| listeners | A map of listener configurations | `map(any)` | `{}` | no |
| logging\_bucket | An S3 bucket used to store access logs | `any` | `null` | no |
| logging\_prefix | A prefix applied to access logs | `any` | `null` | no |
| name\_prefix | Prefix to the load balancer name | `any` | n/a | yes |
| private\_zone | Name of private zone to create DNS alias | `any` | `null` | no |
| security\_groups | A list of security group ids to associate with the load balancer | `list` | `[]` | no |
| subnets | Subnets to deploy into | `any` | n/a | yes |
| target\_groups | A map of target group configurations | `map(any)` | `{}` | no |
| vpc | Name of the VPC to deploy to | `any` | n/a | yes |

## Outputs

No output.

