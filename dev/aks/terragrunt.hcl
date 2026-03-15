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
  source = "../../modules/aks"
}

# dependencies {
#   paths = ["../network", "../security"]
# }
#dependency "network" {
#  config_path = "../network"
#}

# dependency "security" {
#   config_path = "../security"
# }
dependencies {
  paths = ["../network", "../security", "../vm"]
}


inputs = {
  dns_prefix          = local.config.locals.dns_prefix
  cluster_name          = local.config.locals.cluster_name
  # nic_name         = "dev-nic"
  #location         = "East US"
  # resource_group_name = local.config.locals.resource_group_name
  # subnet_id        = dependency.network.outputs.subnet_id
  # public_ip_id     = dependency.network.outputs.public_ip_id
  #admin_username   = "azureuser"
  #ssh_public_key_path = "../../modules/vm/azureagent_key.pub"
}