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
