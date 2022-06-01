# Terraform Cloud Workspace: `terraform-cloud`

This Terraform Cloud Workspace manages the lifecycle of (other) Terraform Cloud Workspaces.

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| tfe_organization | Name of the organization. | `string` | `"a-demo-organization"` | no |
| tfe_workspaces | Names for the Terraform Cloud Workspaces. | <pre>map(object({<br>    name        = string,<br>    description = string,<br>  }))</pre> | <pre>{<br>  "packer_registry": {<br>    "description": "HCP Packer Registry.",<br>    "name": "hcp-packer-registry"<br>  },<br>  "vault_config": {<br>    "description": "HCP Vault Configuration.",<br>    "name": "hcp-vault-config"<br>  },<br>  "vault_deployment": {<br>    "description": "HCP Vault Deployment.",<br>    "name": "hcp-vault-deployment"<br>  }<br>}</pre> | no |

### Outputs

| Name | Description |
|------|-------------|
| tfc_workspace_urls | TFC Workspace URLs. |
<!-- END_TF_DOCS -->