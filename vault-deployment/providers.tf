# The AWS Provider is set to retrieve configuration from the executing environment
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#argument-reference
provider "aws" {
  region = var.aws_region

  # see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#default_tags
  default_tags {
    tags = {
      TerraformManaged = true
      Name             = "HCP Vault deployment (Secure IaC Workflows)"
    }
  }
}

# The HCP Provider is set to retrieve configuration from the executing environment
# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs#schema
provider "hcp" {}

# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs#argument-reference
provider "tfe" {}
