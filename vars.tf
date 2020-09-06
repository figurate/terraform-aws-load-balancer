variable "name" {
  description = "Name to associate with load balancer"
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

variable "port" {
  description = "Load balancer ingress port"
  type        = number
}

variable "protocol" {
  description = "Load balance ingress protocol"
  default     = "HTTPS"
}

variable "certificate_arn" {
  description = "ARN of certificate to use for TLS traffic"
  default     = null
}

variable "target_port" {
  description = "Target group ingress port"
  type        = number
}

variable "target_protocol" {
  description = "Target group ingress protocol"
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
