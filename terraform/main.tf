provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "swarm_sg" {
  name        = "docker-swarm-sg"
  description = "Allow all inbound traffic for Docker Swarm"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Docker Swarm SG"
  }
}

resource "aws_instance" "manager" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [aws_security_group.swarm_sg.name]

  tags = {
    Name = "Swarm Manager"
    Role = "manager"
  }
}

resource "aws_instance" "worker" {
  count         = 2
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [aws_security_group.swarm_sg.name]

  tags = {
    Name = "Swarm Worker ${count.index + 1}"
    Role = "worker"
  }
}