#VPC
variable "vpc_cidr_block" {
  default = "10.200.0.0/16"
}
variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "assign_ipv6_cidr_block" {
  default = "false"
}
## Subnet
# variable "public_subnet_cidr_list" {
#   type        = list
#    default     =["10.200.10.0/24", "10.200.20.0/24"]
# }
# variable "private_subnet_list" {
#   type        = list
#    default     =["10.200.1.0/24", "10.200.2.0/24"]
# }
variable "vpc_subnets_cidr_blocks" {
  type        = list(string)
  description = "CIDR Blocks for Subnets in VPC"
  default     = ["10.200.10.0/24", "10.200.20.0/24", "10.200.1.0/24", "10.200.2.0/24"]
}
