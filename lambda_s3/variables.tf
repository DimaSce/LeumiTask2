# Input variable definitions

variable "aws_region" {
  description = "AWS region for all resources."

  type    = string
  default = "us-east-1"
}

variable "outfile" {
  description = "zip file path"

  type    = string
  default = "${path.module}/hello-world.zip"
}
