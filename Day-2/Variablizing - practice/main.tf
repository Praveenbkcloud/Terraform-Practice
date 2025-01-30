
provider "aws" {

  region = var.region_name

  #   backend "s3" {
  #     bucket = "mydellate"
  #     key    = "terraform.tfstate"
  #     region = "us-east-1"
  #   }

}


resource "aws_vpc" "Vpc-Terra" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = "true"

  tags = {
    Name = var.vpc_tag
  }
}

resource "aws_internet_gateway" "IGW-Terra" {
  vpc_id = aws_vpc.Vpc-Terra.id

  tags = {
    Name = var.IGW_TAG
  }
}


resource "aws_subnet" "Pub-Sub-Terra" {
  vpc_id            = aws_vpc.Vpc-Terra.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.subnet_az

  tags = {
    Name = var.subnet_tag
  }
}

resource "aws_route_table" "RT-Terra" {
  vpc_id = aws_vpc.Vpc-Terra.id

  route {
    cidr_block = var.IGW_CIDR
    gateway_id = aws_internet_gateway.IGW-Terra.id
  }

  tags = {
    Name = var.route_table_tag
  }
}

resource "aws_route_table_association" "RTA-Terra" {
  subnet_id      = aws_subnet.Pub-Sub-Terra.id
  route_table_id = aws_route_table.RT-Terra.id
}

resource "aws_security_group" "SG_Terra" {
  name        = "allow_Terra"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.Vpc-Terra.id

  ingress {

    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "SG_Terra"
  }
}

resource "aws_instance" "Terra-ec2" {
  ami                         = var.ami_id
  availability_zone           = var.ec2_az
  instance_type               = var.ec2_instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.Pub-Sub-Terra.id
  vpc_security_group_ids      = ["${aws_security_group.SG_Terra.id}"]
  associate_public_ip_address = true

  tags = {

    Name  = "Server-1"
    Env   = "Development"
    Owner = "praveen"

  }
}
