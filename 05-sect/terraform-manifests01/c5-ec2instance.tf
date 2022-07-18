

# EC2 Instance
data "aws_availability_zones" "my_aval_zones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}


resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amzlinux.id
  # instance_type = var.instance_type
  # instance_type          = var.instance_type_list[1]    # For List
  instance_type          = var.instance_type_map["dev"] # For Map
  user_data              = file("${path.module}/app1-install.sh")
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]

  # Create EC2 in all Availibility Zones
  for_each          = toset(data.aws_availability_zones.my_aval_zones.names)
  availability_zone = each.key

  tags = {
    "Name" = "Count-Demo-${each.key}"
  }
}
