# EC2 Instance from data, variables, and VPC

resource "aws_instance" "myec2vm" {
  ami           = data.aws_ami.amzlinux.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  user_data     = file("${path.module}/app1-install.sh")
  vpc_security_group_ids = [
    aws_security_group.vpc-ssh.id,
    aws_security_group.vpc-web.id
  ]
  tags = {
    "Name" = "EC2 Demo Dynamic"
  }
}
