module "load_balancer" {
  source = "../.."

  name_prefix     = var.name_prefix
  subnets         = var.subnets
  vpc             = var.vpc
  certificate_arn = var.certificate_arn
  logging_bucket  = var.logging_bucket
  logging_prefix  = var.logging_prefix
  private_zone    = var.private_zone
  security_groups = var.security_groups
  target_groups = {
    default-https = "HTTPS:443"
  }
  listeners = {
    https-443-forward = "default-https"
    http-80-redirect  = "HTTPS:443"
  }
}
