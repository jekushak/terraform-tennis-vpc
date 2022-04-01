# ---------------------------------------------------------------------------------------------------------------------
# Internet Gateway
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    local.common_tags,
    {
      Name    = "${local.aws_vpc_name}-igw"
      AppRole = "Networking & Content Delivery"
    }
  )
}
# ---------------------------------------------------------------------------------------------------------------------
# NAT Gateway
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.main.id
  subnet_id     = var.subnets_id[0]
  #depends_on    = [aws_internet_gateway.igw]
  tags = merge(
    local.common_tags,
    {
      Name    = "${local.aws_vpc_name}-natgw"
      AppRole = "Networking & Content Delivery"
    }
  )
}
resource "aws_eip" "main" {
  vpc = true
  tags = merge(
    local.common_tags,
    {
      Name    = "${local.aws_vpc_name}-eip"
      AppRole = "Compute"
    }
  )
}

