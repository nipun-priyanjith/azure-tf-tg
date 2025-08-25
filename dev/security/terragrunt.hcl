include "root" {
  path = find_in_parent_folders("common.hcl")
}

locals {
  config = read_terragrunt_config(find_in_parent_folders("locals.hcl"))
}
include {
  path = find_in_parent_folders("provider.hcl")
}
terraform {
  source = "../../modules/security"
}

dependency "network" {
  config_path = "../network"
}


inputs = {
  nsg_name             = "dev-nsg"
  #location             = "East US"
  resource_group_name  = dependency.network.outputs.resource_group_name
  subnet_id            = dependency.network.outputs.subnet_id
}
