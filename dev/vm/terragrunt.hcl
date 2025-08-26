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
  source = "../../modules/vm"
}

# dependencies {
#   paths = ["../network", "../security"]
# }
dependency "network" {
  config_path = "../network"
}

dependencies {
  paths = ["../network", "../security"]
}


# dependency "security" {
#   config_path = "../security"
# }


inputs = {
  vm_name          = local.config.locals.vm_name
  nic_name         = "dev-nic"
  #location         = "East US"
  resource_group_name = local.config.locals.resource_group_name
  subnet_id        = dependency.network.outputs.subnet_id
  public_ip_id     = dependency.network.outputs.public_ip_id
  #admin_username   = "azureuser"
  #ssh_public_key_path = "../../modules/vm/azureagent_key.pub"
}
