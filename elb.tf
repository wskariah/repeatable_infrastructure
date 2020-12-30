# Create a new load balancer
resource "aws_elb" "sportstrade-server-elb" {
  name               = "sportstrade-server-elb"
  availability_zones = ["us-east-1a", "us-east-2b", "us-east-2c"]

  access_logs {
    bucket        = "sportstrade"
    bucket_prefix = "spt"
    interval      = 60
  }

  listener {
    instance_port      = 80
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "${var.certificate_arn}"
  }

  instances                   = ["${aws_instance.sportstrade-server.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name         = "sportstrade-server-elb"
    Environment  = "main"
    CreationTime = "${timestamp()}"
  }
}
  