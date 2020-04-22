
resource "kubernetes_namespace" "mysql-operator" {
  metadata {
    name = var.namespace
  }
}

data "helm_repository" "presslabs" {
  name = "presslabs"
  url  = "https://presslabs.github.io/charts"
}

resource "helm_release" "mysql-operator" {
  namespace  = var.namespace
  name       = var.name
  chart      = "presslabs/mysql-operator"
  version    = var.chart_version
  values     = [var.helm_values]
  timeout    = 1200
}