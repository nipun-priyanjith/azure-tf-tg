variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "nic_name" {
  description = "nic_name"
  default = "example-nic"
}
variable "subnet_id" {
  description = "subnet_id"
  type        = string 
}

variable "public_ip_id" {
  description = "public_ip_id"
  type        = string
}
variable "vm_name" {
  description = "Linux VM name"
  type        = string
}
variable "admin_username" {
  description = "VM admin username"
  type        = string
  
}

variable "ssh_public_key_path" {
  description = "Path to SSH public key"
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