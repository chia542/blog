# route53.tf
data "aws_route53_zone" "root" {
  name = "infrari.click."
}

resource "aws_route53_record" "a_record_wordpress" {
  type     = "A"
  zone_id = data.aws_route53_zone.root.id
  name    = "wordpress"
  ttl     = "300"
  records = [aws_lightsail_static_ip.wordpress.ip_address]
}
