# retrieve TFC Organization ID
# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/organization
data "tfe_organization" "main" {
  name = var.tfe_organization
}

# pre-create Terraform Cloud Workspace for HCP Vault Deployment
# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace
resource "tfe_workspace" "vault_deployment" {
  # ⚠️ While Terraform Cloud Workspaces may share a similar configuration, it is best-practice
  # to split out their creation into separate Terraform Resources to avoid accidental deletion.

  allow_destroy_plan            = true
  auto_apply                    = true
  description                   = var.tfe_workspaces.vault_deployment.description
  execution_mode                = "remote"
  name                          = var.tfe_workspaces.vault_deployment.name
  organization                  = data.tfe_organization.main.name
  queue_all_runs                = true
  structured_run_output_enabled = true
}

# pre-create Terraform Cloud Workspace for HCP Vault Deployment
# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace
resource "tfe_workspace" "vault_config" {
  # ⚠️ While Terraform Cloud Workspaces may share a similar configuration, it is best-practice
  # to split out their creation into separate Terraform Resources to avoid accidental deletion.

  allow_destroy_plan            = true
  auto_apply                    = true
  description                   = var.tfe_workspaces.vault_config.description
  execution_mode                = "remote"
  name                          = var.tfe_workspaces.vault_config.name
  organization                  = data.tfe_organization.main.name
  queue_all_runs                = true
  structured_run_output_enabled = true
}
