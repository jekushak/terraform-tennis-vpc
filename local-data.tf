locals {
  app_service  = "tennis"
  environment  = "a"
  cost_centre  = "devOps"
  project      = "slp"
  owner        = "zhenishgul"
  aws_vpc_name = "vpc-${local.environment}-${local.app_service}"
  common_tags = {
    environment = local.environment
    project     = local.project
    cost_centre = local.cost_centre
    owner       = local.owner
  }
}


