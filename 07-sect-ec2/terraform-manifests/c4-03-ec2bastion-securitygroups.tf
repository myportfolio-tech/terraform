# AWS EC2 Security Group Terraform Module
# Security Group for Public Bastion Host

module "public_bastion_security" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "${local.name}-public-bastion-sg"
  description = "Security group for SSH port for everyone and outbound traffic open."
  vpc_id      = module.vpc.vpc_id

  ##Ingress Rules
  ingress_rules = ["https-443-tcp", "ssh-tcp"]
  # ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ##Egress Rules
  egress_rules = ["all-all"]
  tags         = local.common_tags
}
