output "ecs_cluster_arn" {
  value       = aws_ecs_cluster.default.arn
  description = "Arn of the ecs cluster"
}

output "ecs_cluster_id" {
  value       = aws_ecs_cluster.default.id
  description = "Id of the ecs cluster"
}

output "ecs_cluster_name" {
  value       = aws_ecs_cluster.default.name
  description = "Name of the ecs cluster"
}

output "key_pair_private_key" {
  value       = try(tls_private_key.ecs[0].private_key_pem, "")
  sensitive   = true
  description = "private key for allowing to connect to the amazon linux 2 instances"
}

output "key_pair_public_key" {
  value       = try(tls_private_key.ecs[0].public_key_openssh, "")
  description = "public key used on the amazon linux 2 instances"
}

output "service_discovery_dns_namespace_id" {
  value       = aws_service_discovery_private_dns_namespace.main.id
  description = "ID of the discovery namespace"
}

output "service_discovery_dns_namespace_hosted_zone_id" {
  value       = aws_service_discovery_private_dns_namespace.main.hosted_zone
  description = "Hosted zone id of the discovery namespace"
}
