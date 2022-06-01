# see https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/aws_secret_backend
resource "vault_aws_secret_backend" "aws" {
  access_key = var.vault_aws_secret_backend_access_key
  secret_key = var.vault_aws_secret_backend_secret_key
  region     = data.hcp_vault_cluster.main.region
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document
data "aws_iam_policy_document" "aws_backend_consumer" {
  statement {
    sid = "1"

    # ⚠️ Note that wildcard permissions are decidedly NOT a best-practice.
    # Please consult with your Friendly Security Professional to determine
    # what an effective IAM Policy for YOUR use-case could look like.
    actions = [
      "ec2:*",
      "s3:*",
    ]

    resources = [
      "*",
    ]

    condition {
      test     = "IpAddress"
      variable = "aws:SourceIp"
      values = [
        "${var.caller_ip}"
      ]
    }

    effect = "Allow"
  }
}

# see https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/aws_secret_backend_role
resource "vault_aws_secret_backend_role" "consumer" {
  backend         = vault_aws_secret_backend.aws.path
  name            = "consumer"
  credential_type = "iam_user"
  policy_document = data.aws_iam_policy_document.aws_backend_consumer.json
}
