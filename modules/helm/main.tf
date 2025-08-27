

provider "helm" {
  kubernetes = {
    config_path = "C:/Users/HP/.kube/config"
    #config_raw = var.kubeconfig_raw
  }
}
variable "kubeconfig_raw" {
  type        = string
  description = "Raw kubeconfig content from AKS"
}



variable "env" {
  description = "Environment name (dev/test/prod)"
  default = "dev"
}

# --- NGINX ---
resource "helm_release" "nginx" {
  name       = "nginx"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx"
  namespace  = "monitoring"
  create_namespace = true

  values = [file("${path.module}/values-nginx-${var.env}.yaml")]
}

# --- GRAFANA ---
resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  namespace  = "monitoring"
  create_namespace = true

  values = [file("${path.module}/values-grafana-${var.env}.yaml")]
}

resource "helm_release" "prometheus" {
  name             = "prometheus"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "prometheus"
  namespace        = "monitoring"
  create_namespace = true

  values = [file("${path.module}/values-prometheus-${var.env}.yaml")]

}












































# terraform {
#   required_providers {
#     helm = {
#       source  = "hashicorp/helm"
#       version = "~> 2.9"
#     }
#     kubernetes = {
#       source  = "hashicorp/kubernetes"
#       version = "~> 2.29"
#     }
#   }
# }

# provider "helm" {
#   kubernetes {
#     config_path = var.kubeconfig_path
#   }
# }

# # Example: Deploy NGINX Ingress
# resource "helm_release" "nginx_ingress" {
#   name       = "nginx-ingress"
#   repository = "https://kubernetes.github.io/ingress-nginx"
#   chart      = "ingress-nginx"
#   version    = "4.10.0"
#   namespace  = "ingress-nginx"

#   create_namespace = true
#   values = [
#     file("${path.module}/values-nginx.yaml")
#   ]
# }

# # Example: Deploy Grafana
# resource "helm_release" "grafana" {
#   name       = "grafana"
#   repository = "https://grafana.github.io/helm-charts"
#   chart      = "grafana"
#   version    = "7.3.9"
#   namespace  = "monitoring"

#   create_namespace = true
#   values = [
#     file("${path.module}/values-grafana.yaml")
#   ]
# }
