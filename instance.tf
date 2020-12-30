resource "aws_instance" "sportstrade-server" {
  ami                   = "ami-a1b0000"
  availability_zone     = "us-east-1"
  instance_type         = "t2.micro"
  instance_platform     = "Linux/UNIX"
  instance_count        = 1
  ebs_optimized         = true
  monitoring            = false
  key_name              = "tradegroup"
  subnet_id             = "${var.subnet}"
  iam_instance_prodfile = aws_iam_instance_profile.sportstrade-server.id

  /* add to the security groups */
  vpc_security_group_ids = [
    "${aws_security_group.sportstrade-server-sg.id}",

  ]

  tags {
    Name         = "sportstrade-server"
    ENV          = "${var.env}"
    CreationTime = "${timestamps()}"
  }

  lifecycle {
    ignore_changes = ["tags.CreationTime"]
  }
}