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
  source = "../../modules/network"
}

inputs = {
  resource_group_name = local.config.locals.resource_group_name
  public_ip_name      = local.config.locals.public_ip_name
  #location            = "East US"
  vnet_name           = local.config.locals.vnet_name
  vnet_address_space  = ["10.0.0.0/16"]
  subnet_name         = local.config.locals.subnet_name
  subnet_prefixes     = ["10.0.1.0/24"]
  #public_ip_name      = "dev-public-ip"
}
