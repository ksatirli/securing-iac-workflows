terraform {
  # see https://www.terraform.io/language/settings/terraform-cloud
  cloud {
    # see https://www.terraform.io/cli/cloud/settings#organization
    organization = "a-demo-organization"

    # see https://www.terraform.io/cli/cloud/settings#workspaces
    workspaces {
      name = "terraform-cloud-workspaces"
    }
  }

  # see https://www.terraform.io/docs/language/settings/index.html#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/tfe/0.31.0/
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.31.0"
    }
  }

  # see https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
  required_version = ">= 1.2.1"
}
