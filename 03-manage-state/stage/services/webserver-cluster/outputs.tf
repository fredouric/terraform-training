output "public_ip" {
  value       = aws_lb.example.dns_name
  description = "domain of ELB"
}
