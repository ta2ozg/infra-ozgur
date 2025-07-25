variable "key_name" {
  default = "k3s-key"
}

variable "instance_type" {
  default = "t4g.micro"
}

variable "ami" {
  # Ubuntu 22.04 ARM64 AMI ID (us-east-1 bölgesi)
  default = "ami-0b2f6494ff0b07a0e"
}

