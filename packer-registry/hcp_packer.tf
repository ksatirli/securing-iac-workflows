# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/data-sources/packer_iteration
data "hcp_packer_iteration" "consumer" {
  bucket_name = var.hcp_packer_bucket_name
  channel     = var.hcp_packer_bucket_channel
}

# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/data-sources/packer_image
data "hcp_packer_image" "consumer" {
  bucket_name    = var.hcp_packer_bucket_name
  cloud_provider = "aws"
  iteration_id   = data.hcp_packer_iteration.consumer.ulid
  region         = var.aws_region
}

# minimal EC2 example, with HCP Packer-powered AMI selection
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "consumer" {
  ami           = data.hcp_packer_image.consumer.cloud_image_id
  instance_type = "t2.small"
}
