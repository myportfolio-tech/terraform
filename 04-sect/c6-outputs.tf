# Terraform Output

# EC2 Public IP
output "instance_public_ip" {
  description = "Instance public ip"
  value       = aws_instance.myec2vm.public_ip
}

# EC2 Public DNS
output "instance_public_dns" {
  description = "Instance public DNS"
  value       = aws_instance.myec2vm.public_dns
}

