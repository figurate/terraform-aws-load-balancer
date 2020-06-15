variable "name" {
  description = "Name to associate with load balancer"
}

variable "vpc" {
  description = "Name of the VPC to deploy to"
}

variable "subnets" {
  description = "Subnets to deploy into"
}

variable "port" {
  description = "Load balancer ingress port"
  type        = number
}

variable "protocol" {
  description = "Load balance ingress protocol"
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
}
