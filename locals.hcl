locals {
  #env                 = basename(path_relative_to_include())
  env                 = "dev"
  resource_group_name  = "${local.env}-rg"
  vnet_name            = "${local.env}-vnet"
  public_ip_name       = "${local.env}-public-ip"
  vm_name              = "${local.env}-vm"
  subnet_name         = "${local.env}-subnet"
}
