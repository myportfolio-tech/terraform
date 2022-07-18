# Terraform Output Values
/* Concepts Covered
1. For Loop with List
2. For Loop with Map
3. For Loop with Map Advanced
4. Legacy Splat Operator (latest) - Returns List
5. Latest Generalized Splat Operator - Returns the List
*/


# Output - EC2 Public IP with TOSET

output "instance_public_ip" {
  description = "EC2 instance ip from the for_each"
  value       = [for inst in aws_instance.myec2vm : inst.public_ip]
}

output "instance_public_dns" {
  description = "EC2 instance dns from the for_each"
  value       = toset([for inst in aws_instance.myec2vm : inst.public_dns])
}

# Output - DNS with TOMAP

output "instance_public_dns_map" {
  description = "EC2 instance dns to a map"
  value       = tomap({ for az, inst in aws_instance.myec2vm : az => inst.public_dns })
}

