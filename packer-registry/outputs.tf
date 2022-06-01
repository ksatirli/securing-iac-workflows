output "hcp_packer_iterations" {
  description = "HCP Packer Iterations for `consumer`"
  value       = data.hcp_packer_iteration.consumer
}

output "aws_console_ec2_amis_url" {
  description = "AWS Console URL for EC2 AMIs."
  value       = "https://${var.aws_region}.console.aws.amazon.com/ec2/v2/home?region=${var.aws_region}"
}

output "aws_console_ec2_instance_url" {
  description = "AWS Console URL for EC2 Instance."
  value       = "https://${var.aws_region}.console.aws.amazon.com/ec2/v2/home?region=${var.aws_region}#InstanceDetails:instanceId=${aws_instance.consumer.id}"
}
