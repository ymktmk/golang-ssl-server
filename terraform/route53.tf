resource "aws_route53_zone" "zone" {
      name = "ymktmk.ga"
}

resource "aws_route53_record" "www" {
      zone_id = aws_route53_zone.zone.zone_id
      name    = "www.ymktmk.ga"
      type    = "A"
      ttl     = "300"
      records = [aws_eip.eip.public_ip]
}