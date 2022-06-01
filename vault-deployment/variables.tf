# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#argument-reference
variable "aws_region" {
  type        = string
  description = "This is the AWS region."
  default     = "eu-west-1"

  # To create a peering connection between an HVN and your VPC,
  # `aws_region` must reflect the currently supported HCP regions..
  validation {
    condition     = contains(["eu-west-1", "eu-west-2", "eu-central-1"], var.aws_region)
    error_message = "`aws_region` must be one of `eu-west-1`, `eu-west-2`, `eu-central-1`."
  }
}

# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/hvn
variable "hcp_hvn_cidr_block" {
  type        = string
  description = "The CIDR range of the HVN."
  default     = "172.25.16.0/20"

  validation {
    condition = (
      try(cidrhost(var.hcp_hvn_cidr_block, 0), null) != "172.31.0.0"
      && try(cidrnetmask(var.hcp_hvn_cidr_block), null) != "255.255.0.0"
    )

    error_message = "`hcp_hvn_cidr_block` must not collide with the AWS VPC Default CIDR Block."
  }
}

# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/hvn#schema
variable "hcp_hvn_id" {
  type        = string
  description = "The ID of the HashiCorp Virtual Network (HVN)."
  default     = "securing-iac-workflows"
}

variable "hcp_vault_cluster_id" {
  type        = string
  description = "Default identifier to use for resource naming."
  default     = "securing-iac-workflows"
}

# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/vault_cluster#schema
variable "hcp_vault_cluster_public_endpoint" {
  type        = bool
  description = "Denotes that the cluster has a public endpoint."
  default     = true
}

# To enable Metrics support for HCP Vault Clusters, the cluster must be, at least, `standard_small`.
# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/vault_cluster#schema
variable "hcp_vault_cluster_tier" {
  type        = string
  description = "Tier of the HCP Vault cluster."
  default     = "dev"

  validation {
    condition     = contains(["dev", "starter_small", "standard_small", "standard_medium", "standard_large", "plus_small", "plus_medium", "plus_large"], var.hcp_vault_cluster_tier)
    error_message = "`hcp_vault_cluster_tier` needs to be one of `dev`, `starter_small`, `standard_small`, `standard_medium`, `standard_large`, `plus_small`, `plus_medium`, `plus_large`."
  }
}

# HCP Vault versions trail behind OSS-versions for security and maintenance reasons
# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/vault_cluster#schema
variable "hcp_vault_cluster_version" {
  type        = string
  description = "The minimum Vault version to use when creating the cluster."
  default     = "1.10.3"
}

# create shorthands for specific IDs
# see https://www.terraform.io/language/values/locals
locals {
  # HashiCorp Cloud Platform base URL
  hcp_portal_base = "https://portal.cloud.hashicorp.com"

  # HashiCorp Cloud Platform Organization ID
  hcp_org = hcp_vault_cluster.main.organization_id

  # HashiCorp Cloud Platform Project ID
  project_id = hcp_vault_cluster.main.project_id

  # HashiCorp Cloud Platform Network ID
  hvn_name = hcp_hvn.main.hvn_id

  # HashiCorp Cloud Platform Vault Cluster ID
  hcp_vault_id = hcp_vault_cluster.main.cluster_id
}

variable "tfe_organization" {
  type        = string
  description = "Name of the organization."
  default     = "a-demo-organization"
}

variable "workspace_names" {
  type        = list(string)
  description = "List of Workspace Names"

  default = [
    "hcp-vault-config",
    "hcp-packer-registry"
  ]
}
