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


# AWS EC2 Instance Type - List
variable "instance_type_list" {
  description = "Ec2 instance through list"
  type        = list(string)
  default     = ["t3.micro", "t3.small"]
}

#AWS EC2 instance Map
variable "instance_type_map" {
  description = "Ec2 instance through map"
  type        = map(string)
  default = {
    "dev"  = "t3.micro"
    "qa"   = "t3.small"
    "prod" = "t3.large"
  }
}
