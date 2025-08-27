terraform {
  source = "../../modules/helm"
}
dependency "aks" {
  config_path = "../aks"
}

inputs = {
  env = "dev"
  #kubeconfig_path = "C:/Users/HP/.kube/config"
  kubeconfig_raw = dependency.aks.outputs.kubeconfig
  
}


# terraform {
#   source = "../../modules/helm"
# }

# inputs = {
#   kubeconfig_path = "~/.kube/config" # or output from AKS module
# }
