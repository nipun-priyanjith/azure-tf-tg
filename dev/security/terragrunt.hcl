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

dependencies {
  paths = ["../network"]
}

inputs = {
  nsg_name             = "dev-nsg"
  #location             = "East US"
  resource_group_name  = dependency.network.outputs.resource_group_name
  subnet_id            = dependency.network.outputs.subnet_id

  
  security_rules = [
    {
      name                       = "SSH"
      priority                   = 1001
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "HTTP"
      priority                   = 1002
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "HTTPS"
      priority                   = 1003
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "DenyAllInbound"
      priority                   = 2000
      direction                  = "Inbound"
      access                     = "Deny"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}
