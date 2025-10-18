resource "aws_security_group" "jenkins_security_group" {
  name = "allow_all"

  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_subnet" "private_subnet_jenkins" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnets_for_jenkins
  availability_zone = var.availability_zone
  tags = merge(var.common_tags, {
    Name = "private_${var.availability_zone}_jenkins"
  })
}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  tags = merge(var.common_tags, {
    Name    = "illuminati_vpc_IGW_${var.env}"
    Project = "Illuminati"
  })
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.1.0/24"
  availability_zone = var.availability_zone

  map_public_ip_on_launch = true

  tags = merge(var.common_tags, {
    Name = "public_${var.availability_zone}"
  })
}

resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id
  tags = merge(var.common_tags, {
    Name    = "public_route_table_${var.env}"
    Project = "Illuminati"
  })
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_eip" "nat_eip" {
  tags = merge(var.common_tags, {
    Name    = "nat_eip_${var.env}"
    Project = "Illuminati"
  })
}

resource "aws_nat_gateway" "natgateway" {
  allocation_id = aws_eip.nat_eip.allocation_id
  subnet_id     = aws_subnet.public_subnet.id
}


resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_id
  tags = merge(var.common_tags, {
    Name    = "private_route_table_${var.env}"
    Project = "Illuminati"
  })
}

resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.natgateway.id
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_subnet_association_for_jenkins" {
  subnet_id      = aws_subnet.private_subnet_jenkins.id
  route_table_id = aws_route_table.private_route_table.id
}

