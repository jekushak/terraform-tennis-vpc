locals {
  app_service             = "tennis"
  environment             = "dev"
  cost_centre             = "devOps"
  project                 = "slp"
  owner                   = "zhenishgul"
  aws_vpc_name            = "vpc-${local.environment}-${local.app_service}"
  aws_public_subnet_name  = "subnet-${local.environment}-public-${local.app_service}"
  aws_private_subnet_name = "subnet-${local.environment}-private-${local.app_service}"
  common_tags = {
    environment = local.environment
    project     = local.project
    cost_centre = local.cost_centre
    owner       = local.owner
  }
}


