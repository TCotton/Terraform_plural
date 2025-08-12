output "public_dns_hostname" {
  description = "Public DNS hostname of the Nginx server"
  value       = "http://${aws_instance.nginx1.public_dns}"
}
