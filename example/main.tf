module "url_jenkins" {
  source = "../"
  domain_name = var.domain_name
  app_name = var.app_name
  app_namespace = var.app_namespace
  web_internal_port = var.internal_web_port
  annotations = {
    "kubernetes.io/ingress.class" = "nginx"  // Require if used addional annontations. By default exist.
    "nginx.ingress.kubernetes.io/whitelist-source-range" = "10.10.10.0/24, 30.0.0.10/25"
  }
}