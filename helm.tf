
# provider "helm" {
#   kubernetes {
#     config_path = var.kubeconfig
#   }
#   depends_on = [
#     google_container_cluster.primary,
#     null_resource.get_gke_credentials
#   ]
# }

# resource "helm_release" "kubernetes_dashboard" {
#   name       = var.kubernetes_dashboard
#   repository = var.dashboard_repo
#   chart      = var.kubernetes_dashboard
#   namespace  = var.namespace

#   set {
#     name  = "service.type"
#     value = "LoadBalancer"
#   }

#   set {
#     name  = "service.externalPort"
#     value = "9080"
#   }

#   set {
#     name  = "protocolHttp"
#     value = "true"
#   }

#   set {
#     name  = "enableInsecureLogin"
#     value = "true"
#   }

#   set {
#     name  = "rbac.clusterReadOnlyRole"
#     value = "true"
#   }

#   # Explicit dependency to ensure it waits for the GKE cluster and any post-creation configuration.
#   depends_on = [
#     google_container_cluster.primary,
#     # Include dependency on null_resource if it's used for post-cluster creation steps like fetching credentials
#     null_resource.get_gke_credentials
#   ]
# }

