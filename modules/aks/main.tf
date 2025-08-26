
# provider "azurerm" {
#   features {}
#   subscription_id = "59dc8f71-b8aa-4522-ad76-b95085db75b6"   # replace with your subscription ID
#   tenant_id       = "b2c71087-76c3-447c-83b9-1565949aa0e1"   # replace with your tenant ID
# }

# locals {
#   dns_prefix = "${var.cluster_name}-dns"
# }
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix
  #kubernetes_version  = "1.28.4" # optional: remove or adjust to supported version in your region

  default_node_pool {
    name       = "agentpool"
    node_count = var.node_count
    vm_size    = var.node_vm_size
    os_disk_size_gb = 30
    type       = "VirtualMachineScaleSets"
    #mode       = "System"
  }

  linux_profile {
    admin_username = "azureuser"
    ssh_key {
      key_data = file(var.ssh_public_key_path)
    }
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }

 # addon_profile {
  #  kube_dashboard {
   #   enabled = false
    #}
  #}

  tags = {
    created_by = "terraform"
  }
}
