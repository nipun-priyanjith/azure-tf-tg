variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}
variable "location" {
  description = "Azure region"
  type        = string
}
variable "vnet_name" {
  description = "Virtual network name"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}
variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "subnet_prefixes" {
  description = "Subnet address prefixes"
  type        = list(string)
}
variable "public_ip_name" {
  description = "Public IP name"
  type        = string
}
variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
}