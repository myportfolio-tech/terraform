# Terraform Output Values
/* Concepts Covered
1. For Loop with List
2. For Loop with Map
3. For Loop with Map Advanced
4. Legacy Splat Operator (latest) - Returns List
5. Latest Generalized Splat Operator - Returns the List
*/


# Output - For Loop with List

output "for_output_list" {
  description = "For loop with list"
  value       = [for inst in aws_instance.myec2vm : inst.public_dns]
}

# Output - For Loop with Map

output "for_output_map" {
  description = "For loop with map"
  value       = { for inst in aws_instance.myec2vm : inst.id => inst.public_dns }
}

# Output - For Loop with Map - Advanced

output "for_output_map_adv" {
  description = "For loop with map"
  value       = { for c, inst in aws_instance.myec2vm : c => inst.public_dns }
}

# Output Legacy Splat Operator (Legacy) - Returns the List
# Soon to be decomissioned
output "legacy_splat_instance_publicdns" {
  description = "legacy splat operator"
  value       = aws_instance.myec2vm.*.public_dns
}

# Output Latest Generalizes Splat Operator - Returns the List
# Soon to be decomissioned
output "legacy_latest_splat_instance_publicdns" {
  description = "legacy splat operator"
  value       = aws_instance.myec2vm[*].public_dns
}


