terraform {
  # see https://www.terraform.io/language/settings/terraform-cloud
  cloud {
    # see https://www.terraform.io/cli/cloud/settings#organization
    organization = "a-demo-organization"

    # see https://www.terraform.io/cli/cloud/settings#workspaces
    workspaces {
      name = "hcp-packer-registry"
    }
  }

  # see https://www.terraform.io/docs/language/settings/index.html#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/aws/4.16.0
    aws = {
      source  = "hashicorp/aws"
      version = "4.16.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/hcp/0.29.0
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.29.0"
    }
  }

  # see https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
  required_version = ">= 1.2.1"
}
