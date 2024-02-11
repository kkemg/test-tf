resource "aws_route53_zone" "global_dns" {
  name = var.route53_zone
}

resource "aws_route53_record" "global_record" {
  zone_id = aws_route53_zone.global_dns.zone_id
  name    = var.wildcard
  type    = "A"
  ttl     = "300"

  records = [var.aws_instance]
}
