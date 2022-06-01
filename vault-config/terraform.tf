terraform {
  # see https://www.terraform.io/language/settings/terraform-cloud
  cloud {
    # see https://www.terraform.io/cli/cloud/settings#organization
    organization = "a-demo-organization"

    # see https://www.terraform.io/cli/cloud/settings#workspaces
    workspaces {
      name = "hcp-vault-config"
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

    # see https://registry.terraform.io/providers/hashicorp/tfe/0.31.0/
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.31.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/vault/3.6.0/docs
    vault = {
      source  = "hashicorp/vault"
      version = "3.6.0"
    }
  }

  # see https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
  required_version = ">= 1.2.1"
}
