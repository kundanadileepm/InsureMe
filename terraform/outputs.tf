output "master_public_ip" {
  value = aws_instance.master.public_ip
}
output "test-server_public_ip" {
  value = aws_instance.test-server.public_ip
}

