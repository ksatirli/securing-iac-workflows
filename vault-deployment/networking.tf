# retrieve information about the Default VPC for the selected `aws_region`
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc
data "aws_vpc" "default" {
  default = true
  state   = "available"
}

# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/hvn
resource "hcp_hvn" "main" {
  hvn_id         = var.hcp_hvn_id
  cloud_provider = "aws"
  region         = var.aws_region
  cidr_block     = var.hcp_hvn_cidr_block
}

# establish a peering between the Default VPC and HVN
# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/aws_network_peering
resource "hcp_aws_network_peering" "main" {
  hvn_id          = hcp_hvn.main.hvn_id
  peer_account_id = data.aws_vpc.default.owner_id
  peer_vpc_id     = data.aws_vpc.default.id
  peer_vpc_region = hcp_hvn.main.region
  peering_id      = hcp_hvn.main.hvn_id
}

# programmatically accept the peering request between the Default VPC and HVN
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_accepter
resource "aws_vpc_peering_connection_accepter" "peer" {
  vpc_peering_connection_id = hcp_aws_network_peering.main.provider_peering_id
  auto_accept               = true
}
