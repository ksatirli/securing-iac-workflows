# Terraform Cloud Workspace: `vault-deployment`

This Terraform Cloud Workspace manages the deployment of an HCP Vault Cluster.

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws_region | This is the AWS region. | `string` | `"eu-west-1"` | no |
| hcp_hvn_cidr_block | The CIDR range of the HVN. | `string` | `"172.25.16.0/20"` | no |
| hcp_hvn_id | The ID of the HashiCorp Virtual Network (HVN). | `string` | `"securing-iac-workflows"` | no |
| hcp_vault_cluster_id | Default identifier to use for resource naming. | `string` | `"securing-iac-workflows"` | no |
| hcp_vault_cluster_public_endpoint | Denotes that the cluster has a public endpoint. | `bool` | `true` | no |
| hcp_vault_cluster_tier | Tier of the HCP Vault cluster. | `string` | `"dev"` | no |
| hcp_vault_cluster_version | The minimum Vault version to use when creating the cluster. | `string` | `"1.10.3"` | no |
| tfe_organization | Name of the organization. | `string` | `"a-demo-organization"` | no |
| workspace_names | List of Workspace Names | `list(string)` | <pre>[<br>  "hcp-vault-config",<br>  "hcp-packer-registry"<br>]</pre> | no |

### Outputs

| Name | Description |
|------|-------------|
| hcp_vault_cluster_id | The ID of the HCP Vault cluster. |
| hcp_vault_portal_url | HCP Portal URL for Vault. |
| hcp_vault_private_endpoint_url | The private URL for the Vault cluster. |
| hcp_vault_public_endpoint_url | The public URL for the Vault cluster. |
| hvn_portal_url | HCP Portal URL for HVN. |
| tfc_workspace_urls | TFC Workspace URL for `configuration` workflow. |
<!-- END_TF_DOCS -->
