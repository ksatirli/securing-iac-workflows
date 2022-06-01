# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/organization#name
variable "tfe_organization" {
  type        = string
  description = "Name of the organization."
  default     = "a-demo-organization"
}

variable "tfe_workspaces" {
  type = map(object({
    name        = string,
    description = string,
  }))

  description = "Names for the Terraform Cloud Workspaces."

  default = {
    "vault_deployment" : {
      name        = "hcp-vault-deployment"
      description = "HCP Vault Deployment."
    },
    "vault_config" : {
      name        = "hcp-vault-config"
      description = "HCP Vault Configuration."
    },
    "packer_registry" : {
      name        = "hcp-packer-registry"
      description = "HCP Packer Registry."
    }
  }
}
