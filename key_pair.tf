resource "tls_private_key" "ecs" {
  count     = var.create_key_pair ? 1 : 0
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ecs" {
  count      = var.create_key_pair ? 1 : 0
  key_name   = var.key_pair
  public_key = tls_private_key.ecs[0].public_key_openssh

  tags = module.this.tags
}
