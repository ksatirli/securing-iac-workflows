locals {
  # create shorthand for Vault environment variables
  environment_variables = "export VAULT_ADDR='${local.vault_address}' && export VAULT_NAMESPACE='${local.vault_namespace}'"
}

#output "github_actions_workflow_sample" {
#  description = "GitHub Actions Workflow Sample."
#  value       = local.workflow_template
#}
#
output "vault_address" {
  description = "Vault Address."
  value       = local.vault_address
}

output "vault_namespace" {
  description = "Vault Namespace."
  value       = local.vault_namespace
}

output "vault_environment_variables" {
  description = "Vault Environment Variables."
  value       = local.environment_variables
}

# see https://www.vaultproject.io/docs/commands/kv/get
output "vault_test_command_kv_secret" {
  description = "Vault CLI Command to test retrieval of Test Secret."
  value       = "vault kv get -field ${var.generic_secret_name} ${vault_generic_secret.test[0].path}"
}

# see https://www.vaultproject.io/docs/secrets/aws#usage
output "vault_test_command_aws_secret" {
  description = "Vault CLI Command to test retrieval of Test Secret."
  value       = "vault read aws/creds/${vault_aws_secret_backend_role.consumer.name}"
}

output "vault_ui_url_aws_role" {
  description = "Vault UI URL for AWS Role."
  value       = "${data.hcp_vault_cluster.main.vault_public_endpoint_url}/ui/vault/secrets/${vault_aws_secret_backend.aws.id}/show/${vault_aws_secret_backend_role.consumer.name}?namespace=${data.hcp_vault_cluster.main.namespace}"
}
