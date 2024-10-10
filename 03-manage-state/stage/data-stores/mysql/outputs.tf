output "db_address" {
  value       = aws_db_instance.example.address
  description = "Address of the db"
}

output "db_port" {
  value       = aws_db_instance.example.port
  description = "port of the db"
}

