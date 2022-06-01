output "hcp_vault_cluster_id" {
  description = "The ID of the HCP Vault cluster."
  value       = local.hcp_vault_id
}

output "hcp_vault_private_endpoint_url" {
  description = "The private URL for the Vault cluster."
  value       = hcp_vault_cluster.main.vault_public_endpoint_url
}

output "hcp_vault_public_endpoint_url" {
  description = "The public URL for the Vault cluster."
  value       = hcp_vault_cluster.main.vault_public_endpoint_url
}

output "hvn_portal_url" {
  description = "HCP Portal URL for HVN."
  value       = "${local.hcp_portal_base}/orgs/${local.hcp_org}/projects/${local.project_id}/hvns/${local.hvn_name}"
}

output "hcp_vault_portal_url" {
  description = "HCP Portal URL for Vault."
  value       = "${local.hcp_portal_base}/services/vault/${local.hcp_vault_id}/cluster?project_id=${local.project_id}"
}

output "tfc_workspace_urls" {
  description = "TFC Workspace URL for `configuration` workflow."

  value = {
    for k, v in data.tfe_workspace.workspaces : k => "https://app.terraform.io/app/${data.tfe_organization.main.name}/${v.name}"
  }
}
