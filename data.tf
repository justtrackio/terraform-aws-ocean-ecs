data "aws_ssm_parameter" "image_id" {
  name = "/aws/service/ecs/optimized-ami/amazon-linux-2/recommended/image_id"
}

data "aws_route53_zone" "service_discovery" {
  depends_on   = [aws_service_discovery_private_dns_namespace.main]
  name         = var.service_discovery_private_dns_name
  private_zone = true
}
