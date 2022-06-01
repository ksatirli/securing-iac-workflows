# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#argument-reference
variable "aws_region" {
  type        = string
  description = "This is the AWS region."
  default     = "eu-west-1"

  # To create a peering connection between an HVN and your VPC,
  # `aws_region` must reflect the currently supported HCP regions..
  validation {
    condition     = contains(["eu-west-1", "eu-west-2", "eu-central-1"], var.aws_region)
    error_message = "`aws_region` must be one of `eu-west-1`, `eu-west-2`, `eu-central-1`."
  }
}

# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/data-sources/vault_cluster#required
# tflint-ignore: terraform_unused_declarations
variable "hcp_vault_cluster_id" {
  type        = string
  description = "The ID of the HCP Vault cluster."
}

variable "hcp_packer_bucket_name" {
  type        = string
  description = "HCP Packer Bucket Name."
  default     = "securing-iac-workflows"
}

variable "hcp_packer_bucket_channel" {
  type        = string
  description = "HCP Packer Bucket Channel."
  default     = "production"
}
