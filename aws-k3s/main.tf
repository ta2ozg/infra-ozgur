resource "aws_key_pair" "k3s_key" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "k3s_sg" {
  name        = "k3s-sg"
  description = "Allow SSH and Kubernetes API"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "master" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = aws_key_pair.k3s_key.key_name
  security_groups = [aws_security_group.k3s_sg.name]

  tags = {
    Name = "k3s-master"
  }
}

resource "aws_instance" "worker" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = aws_key_pair.k3s_key.key_name
  security_groups = [aws_security_group.k3s_sg.name]

  tags = {
    Name = "k3s-worker"
  }
}

output "master_ip" {
  value = aws_instance.master.public_ip
}

output "worker_ip" {
  value = aws_instance.worker.public_ip
}

