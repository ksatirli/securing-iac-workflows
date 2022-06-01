# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/vault_cluster
resource "hcp_vault_cluster" "main" {
  cluster_id = var.hcp_vault_cluster_id
  hvn_id     = hcp_hvn.main.hvn_id

  min_vault_version = var.hcp_vault_cluster_version
  public_endpoint   = var.hcp_vault_cluster_public_endpoint
  tier              = var.hcp_vault_cluster_tier
}

# ⚠️ Enabling the creation of this resource WILL result in a Vault admin token be persisted in your Terraform State.
# ⚠️ Disabling this resource does NOT invalidate the provisioned admin token.
# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/vault_cluster_admin_token
resource "hcp_vault_cluster_admin_token" "root" {
  cluster_id = hcp_vault_cluster.main.cluster_id
}
