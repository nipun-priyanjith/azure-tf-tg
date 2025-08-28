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
  # name          = "kafka"
  # namespace     = "kafka"
  # chart         = "kafka"
  # repo          = "https://charts.bitnami.com/bitnami"
  # #chart_version = "26.3.0"
  # values        = ["${path_relative_from_include()}/values.yaml"]
}


# terraform {
#   source = "../../modules/helm"
# }

# inputs = {
#   kubeconfig_path = "~/.kube/config" # or output from AKS module
# }
