
provider "helm" {
  kubernetes {
    config_path = var.kubeconfig
  }
}

resource "helm_release" "kubernetes_dashboard" {
  name       = var.kubernetes_dashboard

  repository = var.dashboard_repo
  chart      = var.kubernetes_dashboard
  namespace  = var.namespace

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

    set {
    name  = "service.externalPort"
    value = "9080"
  }

  set {
    name  = "protocolHttp"
    value = "true"
  }

  set {
    name  = "enableInsecureLogin"
    value = "true"
  }

  set {
    name  = "rbac.clusterReadOnlyRole"
    value = "true"
  }

}