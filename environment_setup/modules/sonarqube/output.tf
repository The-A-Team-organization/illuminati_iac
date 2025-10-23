output "public_sonarqube_key_name" {
  description = "The name of the public key pair used for the Sonarqube instance"
  value       = aws_key_pair.sonarqube_key_pair.key_name
}

