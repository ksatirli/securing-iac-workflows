# retrieve TFC Organization ID
# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/organization
data "tfe_organization" "main" {
  name = var.tfe_organization
}

# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/workspace
data "tfe_workspace" "workspaces" {
  # see https://www.terraform.io/docs/language/meta-arguments/for_each.html
  for_each = toset(var.workspace_names)

  name         = each.key
  organization = data.tfe_organization.main.name
}

# create a TFC Variable with an HCP Vault Cluster ID
# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
resource "tfe_variable" "cluster_id_config" {
  # see https://www.terraform.io/docs/language/meta-arguments/for_each.html
  for_each = data.tfe_workspace.workspaces

  key          = "hcp_vault_cluster_id"
  value        = hcp_vault_cluster.main.cluster_id
  category     = "terraform"
  hcl          = false
  sensitive    = false
  workspace_id = each.value.id
  description  = "HCP Vault Cluster ID."
}

# create a TFC Variable with an HCP Vault Admin Token
# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
resource "tfe_variable" "token" {
  # see https://www.terraform.io/docs/language/meta-arguments/for_each.html
  for_each = data.tfe_workspace.workspaces

  # key must coincide with the environment variable that is expected by Vault
  # see https://registry.terraform.io/providers/hashicorp/vault/latest/docs#token_name
  key          = "VAULT_TOKEN"
  value        = hcp_vault_cluster_admin_token.root.token
  category     = "env"
  hcl          = false
  sensitive    = true
  workspace_id = each.value.id
  description  = "HCP Vault Admin Token for `${hcp_vault_cluster.main.cluster_id}`."
}
