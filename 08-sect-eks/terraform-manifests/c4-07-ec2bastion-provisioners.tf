# Create a Null Resource and Provisioner
resource "null_resource" "copy_ec2_keys" {
  depends_on = [module.ec2_public]


  # Connection Block for Provisioner
  connection {
    type        = "ssh"
    host        = aws_eip.bastion_eip.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("private-key/eks-terraform-key.pem")
  }

  # File provisioner
  provisioner "file" {
    source      = "private-key/eks-terraform-key.pem"
    destination = "/tmp/eks-terraform-key.pem"
  }

  # Remote Exec Provisioner - Fix the ssh key permissions on EC2 instance
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/eks-terraform-key.pem"
    ]
  }

  # Local Exec Provisioner
  provisioner "local-exec" {
    command     = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id}>> vpc-creation.txt"
    working_dir = "local-exec-output-files"
  }
}
