resource "tls_private_key" "sskeygen_execution" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "aws_key_pair" "sonarqube_key_pair" {
  depends_on = ["tls_private_key.sskeygen_execution"]
  key_name   = "sonarqube_public"
  public_key = tls_private_key.sskeygen_execution.public_key_openssh
}




resource "aws_iam_role" "sonarqube_role" {
  name = "sonarqube_role_${var.env}"


  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}


resource "aws_iam_role_policy_attachment" "sonarqube_ssm" {
  role       = aws_iam_role.sonarqube_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}


resource "aws_iam_instance_profile" "sonarqube_profile" {
  name = "sonarqube_profile"
  role = aws_iam_role.sonarqube_role.name
}


resource "aws_instance" "sonarqube_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  subnet_id              = var.public_subnet
  vpc_security_group_ids = [var.sonarqube_security_group]
  iam_instance_profile   = aws_iam_instance_profile.sonarqube_profile.name


  key_name = aws_key_pair.sonarqube_key_pair.key_name


  tags = merge(var.common_tags, {
    Name = "sonarqube_instance"
  })


}

