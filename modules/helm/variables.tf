variable "kubeconfig_path" {
  type        = string
  description = "Path to the kubeconfig file for AKS cluster"
  default     = "config"
}
# variable "env" {
#   description = "Environment name (dev/test/prod)"
#   type        = string
# }
# variable "kubeconfig_raw" {
#   type        = string
#   description = "Raw kubeconfig content from AKS"
# }



# variable "name" {}
# variable "repo" {}
# variable "chart" {}
# variable "chart_version" {}
# variable "namespace" {}
# variable "values" {
#   type    = list(string)
#   default = []
# }
