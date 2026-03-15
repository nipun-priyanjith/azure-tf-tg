variable "subscription_id" {
  type    = string
  default = "" # optional: set via env TF_VAR_subscription_id or leave empty to use az CLI auth
}
variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
}
variable "location" {
  type    = string
  default = "West Europe" # change to your preferred region
}

variable "resource_group_name" {
  type    = string
  default = "rg-terraform-aks"
}

variable "cluster_name" {
  type    = string
  #default = "tf-aks-cluster"
}
variable "dns_prefix" {
  type = string
}



variable "ssh_public_key_path" {
  type    = string
  #default = "azureagent_key.pub"
}



variable "node_count" {
  type    = number
  default = 1
}

variable "node_vm_size" {
  type    = string
  default = "Standard_B2s"
  #default = "Standard_DS2_v2"
}



