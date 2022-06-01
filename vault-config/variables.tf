variable "generic_secret_name" {
  type        = string
  description = "Name of Generic Secret (for testing purposes)."
  default     = "EXAMPLESECRET"
}

# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/data-sources/vault_cluster#required
variable "hcp_vault_cluster_id" {
  type        = string
  description = "The ID of the HCP Vault cluster."
}

# see https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount#path
variable "kvv2_path" {
  type        = string
  description = "Where the secret backend will be mounted."
  default     = "secret"
}

variable "provision_test_secret" {
  type        = bool
  description = "Boolean Toggle to enable provisioning of Generic Vault Secret."
  default     = true
}

# ⚠️ Note that the value of this variable will be written to Terraform State
# see https://www.terraform.io/language/state/sensitive-data
variable "vault_aws_secret_backend_access_key" {
  type        = string
  description = "Access Key for Vault AWS Secrets Backend"
  default     = "AKIAIOSFODNN7EXAMPLE"
  sensitive   = true
}

# ⚠️ Note that the value of this variable will be written to Terraform State
# see https://www.terraform.io/language/state/sensitive-data
variable "vault_aws_secret_backend_secret_key" {
  type        = string
  description = "Secret Access Key for Vault AWS Secrets Backend"
  default     = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
  sensitive   = true
}

variable "caller_ip" {
  type        = string
  description = "Caller IP address."
}
