variable "profile" {
  default = "terraform_iam_user"
}

variable "region" {
  default = "us-east-1a"
}

variable "instance" {
  default = "t2.micro"
}

variable "subnet" {
}

variable "vpc_id" {
}

variable "route53_zone_id" {
}

variable "instance_count" {
  default = "1"
}