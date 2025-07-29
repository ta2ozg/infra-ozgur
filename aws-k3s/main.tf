resource "aws_instance" "k3s_master" {
  ami           = "ami-0c94855ba95c71c99"  # Örnek: Amazon Linux 2 (us-east-1)
  instance_type = "t3.micro"

  key_name = "my-ssh-key"  # AWS'de oluşturduğun SSH key pair adı

  tags = {
    Name = "k3s-master"
  }
}

resource "aws_instance" "k3s_worker" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t3.micro"

  key_name = "my-ssh-key"

  tags = {
    Name = "k3s-worker"
  }
}

resource "aws_instance" "db_server" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t3.micro"

  key_name = "my-ssh-key"

  tags = {
    Name = "db-server"
  }
}

resource "aws_instance" "backend_server" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t3.micro"

  key_name = "my-ssh-key"

  tags = {
    Name = "backend-server"
  }
}
