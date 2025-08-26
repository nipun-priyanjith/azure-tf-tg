output "resource_group" {
  value = azurerm_resource_group.rg.name
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
}
