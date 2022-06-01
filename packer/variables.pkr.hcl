# This file is automatically loaded by Packer

variable "ami_name" {
  type        = string
  description = "Name of AMI."
  default     = "securing-iac-workflows"
}

# see https://www.packer.io/docs/builders/amazon/ebs#availability_zone
variable "availability_zone" {
  type        = string
  description = "Destination availability zone to launch instance in."
  default     = "eu-west-1c"

  # An override for this may be specified in `./overrides.auto.pkrvars.hcl`
}

# see https://www.packer.io/docs/builders/amazon/ebs#region
variable "aws_region" {
  type        = string
  description = "The name of the region in which to launch the EC2 instance to create the AMI."
  default     = "eu-west-1"

  # An override for this may be specified in `./overrides.auto.pkrvars.hcl`
}

# see https://www.packer.io/docs/builders/amazon/ebs#vpc_id
variable "vpc_id" {
  type        = string
  description = "Requires subnet_id to be set. Used to create a temporary security group within the VPC. If this field is left blank, Packer will try to get the VPC ID from the subnet_id."
  default     = ""
}

locals {
  tags = {
    "Name"                = var.ami_name
    "image:builder"       = "Packer"
    "image:source-id"     = data.amazon-ami.image.id
    "image:source-name"   = data.amazon-ami.image.name
    "image:source-region" = var.aws_region
  }
}
