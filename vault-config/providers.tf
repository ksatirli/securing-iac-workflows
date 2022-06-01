# The HCP Provider is set to retrieve configuration from the executing environment
# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs#schema
provider "hcp" {}

# retrieve `VAULT_ADDR` from HCP Vault
# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/data-sources/vault_cluster
data "hcp_vault_cluster" "main" {
  cluster_id = var.hcp_vault_cluster_id
}

# see https://registry.terraform.io/providers/hashicorp/vault/latest/docs#provider-arguments
provider "vault" {
  address   = data.hcp_vault_cluster.main.vault_public_endpoint_url
  namespace = data.hcp_vault_cluster.main.namespace
}

locals {
  # create shorthands for Vault configuration settings
  vault_address   = data.hcp_vault_cluster.main.vault_public_endpoint_url
  vault_namespace = data.hcp_vault_cluster.main.namespace
}

# The AWS Provider is set to retrieve configuration from the executing environment
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#argument-reference
provider "aws" {
  region = data.hcp_vault_cluster.main.region

  # see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#default_tags
  default_tags {
    tags = {
      TerraformManaged = true
      Name             = "HCP Vault configuration (Secure IaC Workflows)"
    }
  }
}
