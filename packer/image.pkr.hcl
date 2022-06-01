packer {
  # see https://www.packer.io/docs/templates/hcl_templates/blocks/packer#version-constraint-syntax
  required_version = ">= 1.8.1"

  # see https://www.packer.io/docs/templates/hcl_templates/blocks/packer#specifying-plugin-requirements
  required_plugins {
    # see https://github.com/hashicorp/packer-plugin-amazon/releases/
    amazon = {
      version = "1.1.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

# see https://www.packer.io/docs/datasources/amazon/ami
data "amazon-ami" "image" {
  filters = {
    name             = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
    root-device-type = "ebs"
  }

  most_recent = true

  # see # see https://ubuntu.com/server/docs/cloud-images/amazon-ec2
  owners      = [
    "099720109477"
  ]

  region      = var.aws_region
}

# see https://www.packer.io/docs/builders/amazon/ebs
source "amazon-ebs" "image" {
  # the following configuration represents a curated variable selection
  # for all options see: https://www.packer.io/docs/builders/amazon/ebs

  ami_name                    = var.ami_name
  ami_virtualization_type     = "hvm"
  associate_public_ip_address = false
  availability_zone           = var.availability_zone

  aws_polling {
    delay_seconds = 30
    max_attempts  = 50
  }

  communicator          = "ssh"
  disable_stop_instance = false
  ebs_optimized         = false
  enable_t2_unlimited   = false
  ena_support           = false
  encrypt_boot          = null
  force_delete_snapshot = false
  force_deregister      = true
  instance_type         = "t2.small"
  region                = var.aws_region

  run_tags = {
    "image:builder"   = "Packer"
    "image:source-id" = data.amazon-ami.image.id
  }

  shutdown_behavior = "stop"

  # see https://www.packer.io/plugins/builders/amazon/ebs#ssh_clear_authorized_keys
  ssh_clear_authorized_keys = true

  # see https://www.packer.io/plugins/builders/amazon/ebs#ssh_disable_agent_forwarding
  ssh_disable_agent_forwarding = false

  ssh_username = "ubuntu"
  source_ami   = data.amazon-ami.image.id

  tags = {
    "Name"                = var.ami_name
    "image:builder"       = "Packer"
    "image:source-id"     = data.amazon-ami.image.id
    "image:source-name"   = data.amazon-ami.image.name
    "image:source-region" = var.aws_region
  }

  vpc_id = var.vpc_id
}

build {
  # see https://www.packer.io/docs/templates/hcl_templates/blocks/build/hcp_packer_registry
  hcp_packer_registry {
    bucket_name = var.ami_name

    bucket_labels = {
      "source_id"     = data.amazon-ami.image.id
      "source_name"   = data.amazon-ami.image.name
      "source_region" = var.aws_region
    }

    description = "Securing IaC Workflows with HCP Packer"
  }

  sources = [
    "source.amazon-ebs.image"
  ]

  provisioner "shell" {
    inline = [
      "echo 'Image built at {{timestamp}} as part of Iteration ${packer.iterationID}' > /tmp/buildinfo.txt",
    ]
  }
}
