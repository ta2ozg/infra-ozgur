output "k3s_master_ip" {
  value = aws_instance.k3s_master.public_ip
}

output "k3s_worker_ip" {
  value = aws_instance.k3s_worker.public_ip
}

output "db_server_ip" {
  value = aws_instance.db_server.public_ip
}

output "backend_server_ip" {
  value = aws_instance.backend_server.public_ip
}
