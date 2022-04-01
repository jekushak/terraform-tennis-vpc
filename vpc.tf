# ---------------------------------------------------------------------------------------------------------------------
# VPC
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_vpc" "main" {
  cidr_block                       = var.vpc_cidr_block
  instance_tenancy                 = var.vpc_instance_tenancy
  assign_generated_ipv6_cidr_block = var.assign_ipv6_cidr_block
  enable_dns_hostnames             = var.enable_dns_hostnames
  tags = merge(
    local.common_tags,
    {
      Name    = local.aws_vpc_name
      AppRole = "Networking & Content Delivery"
    }
  )
}
