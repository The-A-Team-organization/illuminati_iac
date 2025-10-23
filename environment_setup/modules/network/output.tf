output "public_subnet" {
  description = "The id of public subnet"
  value       = aws_subnet.public_subnet.id
}


output "jenkins_security_group_id" {
  description = "The id of jenkins security group"
  value       = aws_security_group.jenkins_security_group.id
}
output "sonarqube_security_group_id" {
  description = "The id of sonarqube security group"
  value       = aws_security_group.sonarqube_security_group.id
}

