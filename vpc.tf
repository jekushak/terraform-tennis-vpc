# ---------------------------------------------------------------------------------------------------------------------
# VPC
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  # instance_tenancy                 = var.vpc_instance_tenancy
  assign_generated_ipv6_cidr_block = var.assign_ipv6_cidr_block
  enable_dns_hostnames             = var.enable_dns_hostnames
  tags = merge(
    local.common_tags,
    {
      Name    = "Tennis-App-VPC"
      AppRole = "Networking & Content Delivery"
    }
  )
}
# ---------------------------------------------------------------------------------------------------------------------
# Internet Gateway
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    local.common_tags,
    {
      Name    = "Tennis-App-IGW"
      AppRole = "Networking & Content Delivery"
    }
  )
}
# ---------------------------------------------------------------------------------------------------------------------
# NAT Gateway
# ---------------------------------------------------------------------------------------------------------------------

# resource "aws_nat_gateway" "natgw" {
#   allocation_id = aws_eip.example.id
#   subnet_id     = aws_subnet.public-subnet1.id
#   depends_on    = [aws_internet_gateway.igw]
#   tags  = local.common_tags
# }
# ---------------------------------------------------------------------------------------------------------------------
# Route
# ---------------------------------------------------------------------------------------------------------------------
# ROUTING #
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge(
    local.common_tags,
    {
      Name    = "Tennis-App-Route"
      AppRole = "Networking & Content Delivery"
    }
  )
}

resource "aws_route_table_association" "rta-public-subnet" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public-route-table.id
}
resource "aws_route_table_association" "rta-private-subnet" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.public-route-table.id
}
