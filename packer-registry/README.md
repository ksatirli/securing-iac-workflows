# Terraform Cloud Workspace: `packer-registry`

This Terraform Cloud Workspace manages the configuration of an HCP Packer Registry.

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| hcp_vault_cluster_id | The ID of the HCP Vault cluster. | `string` | n/a | yes |
| aws_region | This is the AWS region. | `string` | `"eu-west-1"` | no |
| hcp_packer_bucket_channel | HCP Packer Bucket Channel. | `string` | `"production"` | no |
| hcp_packer_bucket_name | HCP Packer Bucket Name. | `string` | `"securing-iac-workflows"` | no |

### Outputs

| Name | Description |
|------|-------------|
| aws_console_ec2_amis_url | AWS Console URL for EC2 AMIs. |
| aws_console_ec2_instance_url | AWS Console URL for EC2 Instance. |
| hcp_packer_iterations | HCP Packer Iterations for `consumer` |
<!-- END_TF_DOCS -->
