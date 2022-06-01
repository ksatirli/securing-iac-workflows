# Terraform Cloud Workspace: `vault-config`

This Terraform Cloud Workspace manages the configuration of an HCP Vault Cluster.

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| caller_ip | Caller IP address. | `string` | n/a | yes |
| hcp_vault_cluster_id | The ID of the HCP Vault cluster. | `string` | n/a | yes |
| generic_secret_name | Name of Generic Secret (for testing purposes). | `string` | `"EXAMPLESECRET"` | no |
| kvv2_path | Where the secret backend will be mounted. | `string` | `"secret"` | no |
| provision_test_secret | Boolean Toggle to enable provisioning of Generic Vault Secret. | `bool` | `true` | no |
| vault_aws_secret_backend_access_key | Access Key for Vault AWS Secrets Backend | `string` | `"AKIAIOSFODNN7EXAMPLE"` | no |
| vault_aws_secret_backend_secret_key | Secret Access Key for Vault AWS Secrets Backend | `string` | `"wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"` | no |

### Outputs

| Name | Description |
|------|-------------|
| vault_address | Vault Address. |
| vault_environment_variables | Vault Environment Variables. |
| vault_namespace | Vault Namespace. |
| vault_test_command_aws_secret | Vault CLI Command to test retrieval of Test Secret. |
| vault_test_command_kv_secret | Vault CLI Command to test retrieval of Test Secret. |
| vault_ui_url_aws_role | Vault UI URL for AWS Role. |
<!-- END_TF_DOCS -->
