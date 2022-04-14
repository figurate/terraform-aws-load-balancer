/**
 * # ![AWS](aws-logo.png) Load Balancer
 *
 * [![CI](https://github.com/figurate/terraform-aws-load-balancer/actions/workflows/main.yml/badge.svg)](https://github.com/figurate/terraform-aws-load-balancer/actions/workflows/main.yml)
 *
 *
 * Purpose: Blueprints for AWS Load Balancers.
 */
data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc]
  }
}

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  tags = {
    Name = var.subnets
  }
}

data "aws_route53_zone" "private_zone" {
  count        = var.private_zone != null ? 1 : 0
  name         = "${var.private_zone}."
  private_zone = true
}

resource "aws_lb" "load_balancer" {
  name_prefix     = var.name_prefix
  internal        = true
  subnets         = data.aws_subnets.subnets.ids
  security_groups = var.security_groups

  dynamic "access_logs" {
    for_each = var.logging_bucket != null ? [1] : []
    content {
      bucket  = var.logging_bucket
      prefix  = var.logging_prefix != null ? var.logging_prefix : var.name_prefix
      enabled = true
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_target_group" "load_balancer" {
  for_each    = var.target_groups
  name_prefix = each.key
  protocol    = split(":", each.value)[0]
  port        = split(":", each.value)[1]
  vpc_id      = data.aws_vpc.vpc.id
}

resource "aws_lb_listener" "load_balancer" {
  for_each          = var.listeners
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = local.rules[each.key][0]
  #checkov:skip=CKV_AWS_2:Dynamic listener config
  protocol        = local.rules[each.key][1]
  certificate_arn = var.certificate_arn

  dynamic "default_action" {
    for_each = local.rules[each.key][2] == "forward" ? [1] : []
    content {
      type             = "forward"
      target_group_arn = aws_lb_target_group.load_balancer[each.value].arn
    }
  }

  dynamic "default_action" {
    for_each = local.rules[each.key][2] == "redirect" ? [1] : []
    content {
      type = "redirect"
      redirect {
        status_code = "HTTP_301"
        protocol    = split(each.value)[0]
        port        = split(each.value)[1]
      }
    }
  }
}

resource "aws_route53_record" "load_balancer" {
  count   = var.private_zone != null ? 1 : 0
  name    = var.name_prefix
  type    = "A"
  zone_id = data.aws_route53_zone.private_zone[0].zone_id
  alias {
    evaluate_target_health = false
    name                   = aws_lb.load_balancer.dns_name
    zone_id                = aws_lb.load_balancer.zone_id
  }
}
