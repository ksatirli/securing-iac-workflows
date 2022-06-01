output "tfc_workspace_urls" {
  description = "TFC Workspace URLs."

  value = [
    "https://app.terraform.io/app/${data.tfe_organization.main.name}/${tfe_workspace.vault_deployment.name}",
    "https://app.terraform.io/app/${data.tfe_organization.main.name}/${tfe_workspace.vault_config.name}",
  ]
}
