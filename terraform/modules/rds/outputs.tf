output "rds_endpoint" {
  value = aws_rds_cluster.main.endpoint
}
output "database_name" {
  value = aws_rds_cluster.main.database_name
}
