# Get Latest AMI ID for Amazon Linux2 OS
data "aws_ami" "amzlinux2" {
  most_recent      = true
  owners           = ["amazon"] # Owner of the AMI

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-gp2"] # Search for AMI name in public market using AMI ID (delete space between hvm-*-gp2, also add star), helps to filter
  }

  filter {
    name   = "root-device-type" # Info on AMI details
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type" #info on AMI detailsa
    values = ["hvm"]
  }

  filter {
    name   = "architecture"  # add  Define chip architecture and value
    values = ["x86_64"]
  }
}