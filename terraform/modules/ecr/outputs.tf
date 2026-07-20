output "ecr_repository_urls" {
  value = {
    for name, repo in aws_ecr_repository.main : name => repo.repository_url
  }
}

output "ecr_repository_names" {
  value = [
    for repo in aws_ecr_repository.main : repo.name
  ]
}
