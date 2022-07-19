# Datasource 1
data "aws_availability_zones" "my_aval_zones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

# Datasource-2
data "aws_ec2_instance_type_offerings" "my_ins_type" {

  for_each = toset(data.aws_availability_zones.my_aval_zones.names)

  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }
  filter {
    name   = "location"
    values = [each.key]
  }

  location_type = "availability-zone"
}


# Basic Output
output "output_v3_1" {
  #value = data.aws_ec2_instance_type_offerings.my_ins_type1.instance_types
  value = {
    for az, val in data.aws_ec2_instance_type_offerings.my_ins_type : az => val.instance_types
  }
}

# Filtered Output
output "output_v3_2" {
  #value = data.aws_ec2_instance_type_offerings.my_ins_type1.instance_types
  value = {
    for az, val in data.aws_ec2_instance_type_offerings.my_ins_type :
    az => val.instance_types if length(val.instance_types) != 0
  }
}

# Keys Filtered Output
output "output_v3_3" {
  #value = data.aws_ec2_instance_type_offerings.my_ins_type1.instance_types
  value = toset(
    keys({
      for az, val in data.aws_ec2_instance_type_offerings.my_ins_type :
    az => val.instance_types if length(val.instance_types) != 0 })
  )
}

# Keys Filtered Output
output "output_v3_4" {
  #value = data.aws_ec2_instance_type_offerings.my_ins_type1.instance_types
  value = keys({
    for az, val in data.aws_ec2_instance_type_offerings.my_ins_type :
  az => val.instance_types if length(val.instance_types) != 0 })[0]
}


