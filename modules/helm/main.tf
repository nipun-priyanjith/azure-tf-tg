terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.9"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.29"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = var.kubeconfig_path
  }
}

# Example: Deploy NGINX Ingress
resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.10.0"
  namespace  = "ingress-nginx"

  create_namespace = true
  values = [
    file("${path.module}/values-nginx.yaml")
  ]
}

# Example: Deploy Grafana
resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  version    = "7.3.9"
  namespace  = "monitoring"

  create_namespace = true
  values = [
    file("${path.module}/values-grafana.yaml")
  ]
}
