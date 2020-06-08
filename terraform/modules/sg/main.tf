provider "aws" {
  region = var.region
}

resource "aws_security_group" "sg" {
  name        = "allow_${var.port}"
  description = "Allow ${var.port} inbound traffic"
  vpc_id      = var.vpc

  ingress {
    description = "port ${var.port} inbound traffic"
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = var.cidr_block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}