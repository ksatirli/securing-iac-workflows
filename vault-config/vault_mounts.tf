# see https://www.vaultproject.io/docs/secrets/kv/kv-v2
# and https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount
resource "vault_mount" "kvv2" {
  path        = var.kvv2_path
  type        = "kv-v2"
  description = "KV Secrets Engine (v2) Mount."
}
