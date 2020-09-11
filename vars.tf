variable "name_prefix" {
  description = "Prefix to the load balancer name"
}

variable "vpc" {
  description = "Name of the VPC to deploy to"
}

variable "subnets" {
  description = "Subnets to deploy into"
}

variable "security_groups" {
  description = "A list of security group ids to associate with the load balancer"
  default     = []
}

variable "target_groups" {
  description = "A map of target group configurations"
  type        = map(any)
  default = {
    default-https = "HTTPS:443"
  }
}

variable "listeners" {
  description = "A map of listener configurations"
  type        = map(any)
  default = {
    https-443-forward = "default-https"
    http-80-redirect  = "HTTPS:443"
  }
}

variable "certificate_arn" {
  description = "ARN of certificate to use for TLS traffic"
  default     = null
}

variable "private_zone" {
  description = "Name of private zone to create DNS alias"
  default     = null
}

variable "logging_bucket" {
  description = "An S3 bucket used to store access logs"
  default     = null
}

variable "logging_prefix" {
  description = "A prefix applied to access logs"
  default     = null
}
