# see https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document
data "vault_policy_document" "consumer" {
  rule {
    # Consider updating this path to reflect a more limited selection:
    path = "${vault_mount.kvv2.path}/*"

    # GitHub Actions Runners are only expected to consume (Read) KV v2 secrets.
    # Other lifecycle operations (Create, Update, Delete) are handled outside of GHA.
    capabilities = [
      "read"
    ]

    description = "Allow Consumers to Create, Read KV Secrets"
  }
}

# see https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy
resource "vault_policy" "consumer" {
  name   = "consumer"
  policy = data.vault_policy_document.consumer.hcl
}
