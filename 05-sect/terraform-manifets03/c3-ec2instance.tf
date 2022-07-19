
# EC2 Instance
resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amzlinux.id
  # instance_type = var.instance_type
  # instance_type          = var.instance_type_list[1]    # For List
  instance_type          = var.instance_type_map["dev"] # For Map
  user_data              = file("${path.module}/app1-install.sh")
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]

  for_each = toset(keys({
    for az, val in data.aws_ec2_instance_type_offerings.my_ins_type :
  az => val.instance_types if length(val.instance_types) != 0 }))

  availability_zone = each.key
  tags = {
    "Name" = "Foreach-Demo-${each.key}"
  }
}
