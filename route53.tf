resource "aws_route53_record" "sportstrade" {
  zone_id = "${var.route53_zone_id}"
  name    = "sportstrade"
  type    = "A"
  ttl     = "300"
  records = ["${aws_elb.sportstrade-server-elb.dns_name}"]
}