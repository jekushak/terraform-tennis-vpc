# ---------------------------------------------------------------------------------------------------------------------
# Subnet
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_subnet" "public-subnet-1" {
  cidr_block              = var.vpc_subnets_cidr_blocks[0]
  vpc_id                  = aws_vpc.main.id
  availability_zone       = "eu-north-1a"
  map_public_ip_on_launch = "true"
  tags = merge(
    local.common_tags,
    {
      Name    = "Public-Tennis-Subnet-1"
      AppRole = "Networking & Content Delivery"
    }
  )
}

resource "aws_subnet" "public-subnet-2" {
  cidr_block              = var.vpc_subnets_cidr_blocks[1]
  vpc_id                  = aws_vpc.main.id
  availability_zone       = "eu-north-1b"
  map_public_ip_on_launch = "true"
  tags = merge(
    local.common_tags,
    {
      Name    = "Public-Tennis-Subnet-2"
      AppRole = "Networking & Content Delivery"
    }
  )
}

resource "aws_subnet" "private-subnet-1" {
  cidr_block              = var.vpc_subnets_cidr_blocks[2]
  vpc_id                  = aws_vpc.main.id
  availability_zone       = "eu-north-1a"
  map_public_ip_on_launch = "true"
  tags = merge(
    local.common_tags,
    {
      Name    = "Private-Tennis-Subnet-1"
      AppRole = "Networking & Content Delivery"
    }
  )
}
resource "aws_subnet" "private-subnet-2" {
  cidr_block              = var.vpc_subnets_cidr_blocks[3]
  vpc_id                  = aws_vpc.main.id
  availability_zone       = "eu-north-1b"
  map_public_ip_on_launch = "true"
  tags = merge(
    local.common_tags,
    {
      Name    = "Private-Tennis-Subnet-2"
      AppRole = "Networking & Content Delivery"
    }
  )
}
