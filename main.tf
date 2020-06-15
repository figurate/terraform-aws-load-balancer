/**
 * # ![AWS](aws-logo.png) Load Balancer
 *
 * Purpose: Blueprints for AWS Load Balancers.
 */
data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc]
  }
}

data "aws_subnet_ids" "subnets" {
  vpc_id = data.aws_vpc.vpc.id
  tags = {
    Name = var.subnets
  }
}

data "aws_route53_zone" "private_zone" {
  name         = var.private_zone
  private_zone = true
}

resource "aws_lb" "load_balancer" {
  internal        = true
  subnets         = data.aws_subnet_ids.subnets.ids
  security_groups = []
}

resource "aws_lb_target_group" "load_balancer" {
  port     = var.target_port
  protocol = var.target_protocol
  vpc_id   = data.aws_vpc.vpc.id
}

resource "aws_lb_listener" "load_balancer" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = var.port
  protocol          = var.protocol
  certificate_arn   = var.certificate_arn
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.load_balancer.arn
  }
}

resource "aws_route53_record" "load_balancer" {
  name    = var.name
  type    = "A"
  zone_id = data.aws_route53_zone.private_zone.zone_id
  alias {
    evaluate_target_health = false
    name                   = aws_lb.load_balancer.dns_name
    zone_id                = aws_lb.load_balancer.zone_id
  }
}