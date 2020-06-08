provider "aws" {
  region = var.region
}
resource "aws_key_pair" "access_key" {
  key_name   = var.access-key-name
  public_key = var.public_key
}