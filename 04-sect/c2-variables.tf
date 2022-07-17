# Input Variables

# AWS Region
variable "aws_region" {
  description = "Region to crate resources"
  type        = string
  default     = "us-east-1"
}

# Instance Type
variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t3.micro"

}

# Instance Keypair
variable "instance_keypair" {
  description = "AWS EC2 Keypair to build ec2s for this class"
  type        = string
  default     = "terraform_key"
}



