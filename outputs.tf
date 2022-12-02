output "ecs_cluster_id" {
  value       = aws_ecs_cluster.default.id
  description = "Id of the ecs cluster"
}

output "ecs_cluster_arn" {
  value       = aws_ecs_cluster.default.arn
  description = "Arn of the ecs cluster"
}
