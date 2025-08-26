terraform {
  source = "../../modules/helm"
}

inputs = {
  kubeconfig_path = "~/.kube/config" # or output from AKS module
}
