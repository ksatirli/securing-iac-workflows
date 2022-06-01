# Securing Infrastructure as Code Workflows

> This repository showcases how to secure IaC workflows using HashiCorp Cloud offerings HCP Vault and HCP Packer.

## Table of Contents

- [Securing Infrastructure as Code Workflows](#securing-infrastructure-as-code-workflows)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Requirements](#requirements)
  - [Author Information](#author-information)
  - [License](#license)

## Overview

This repository deploys several Terraform Cloud Workspaces, a HashiCorp Cloud Platform (HCP) Vault Cluster, and a HashiCorp Packer Registry.

- The [terraform-cloud](./terraform-cloud/) workflow creates a HashiCorp Virtual Network (HVN) and deploys an HCP Vault Cluster.
- The [vault-deployment](./vault-deployment/) workflow creates a HashiCorp Virtual Network (HVN) and deploys an HCP Vault Cluster.
- The [vault-config](./vault-config/)  workflow configures Vault and enables AWS credential vending.
- The [packer](./packer/)  workflow creates an EC2 AMI with Packer and stores metadata in HCP Packer.
- The [packer-registry](./packer-registry/)  workflow consumes HCP Packer metadata and deploys an EC2 Instance.

## Requirements

- Terraform CLI `v1.2.1` (or newer)
- Terraform Cloud [account](https://app.terraform.io/signup/account)
- HashiCorp cloud Platform [account](https://portal.cloud.hashicorp.com/sign-in)
- AWS [account](https://aws.amazon.com/free/)

## Author Information

This repository is maintained by the contributors listed on [GitHub](https://github.com/ksatirli/how-to-secure-iac-workflows/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
