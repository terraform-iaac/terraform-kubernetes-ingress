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
  tls = [ // You can define few TLS. Kube will automatically choose correct certificate for url. If you want to use http traffit, please don't write tls option.
    kubernetes_secret.wilcart-tls.metadata[0].name,
    kubernetes_secret.domain-tls.metadata[0].name
  ]
}