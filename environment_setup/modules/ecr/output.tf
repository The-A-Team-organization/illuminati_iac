output "frontend_repo_uri" {
  value = aws_ecr_repository.repos["frontend"].repository_url
}

output "backend_repo_uri" {
  value = aws_ecr_repository.repos["backend"].repository_url
}

output "go_service_repo_uri" {
  value = aws_ecr_repository.repos["go_service"].repository_url
}

output "mariadb_repo_uri" {
  value = aws_ecr_repository.repos["mariadb"].repository_url
}
