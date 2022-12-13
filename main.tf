resource "kubernetes_ingress_v1" "ingress" {
  count = var.ingress_v1_enable ? 1 : 0

  metadata {
    name        = var.ingress_name != null ? var.ingress_name : var.service_name
    namespace   = var.service_namespace
    annotations = var.annotations
  }
  spec {
    ingress_class_name = var.ingress_class_name

    dynamic "rule" {
      for_each = var.rule
      content {
        host = "${lookup(rule.value, "sub_domain", "")}${lookup(rule.value, "domain", var.domain_name)}"
        http {
          path {
            path      = lookup(rule.value, "path", null)
            path_type = lookup(rule.value, "path_type", var.path_type)
            backend {
              service {
                name = lookup(rule.value, "service_name", var.service_name)
                port {
                  number = rule.value.external_port
                }
              }
            }
          }
        }
      }
    }
    dynamic "tls" {
      for_each = var.tls
      content {
        secret_name = tls.value
      }
    }
    dynamic "tls" {
      for_each = var.tls_hosts
      content {
        secret_name = tls.value.secret_name
        hosts       = tls.value.hosts
      }
    }
  }
}

resource "kubernetes_ingress" "ingress" {
  count = var.ingress_v1_enable ? 0 : 1

  metadata {
    name        = var.ingress_name != null ? var.ingress_name : var.service_name
    namespace   = var.service_namespace
    annotations = var.annotations
  }
  spec {
    ingress_class_name = var.ingress_class_name

    dynamic "rule" {
      for_each = var.rule
      content {
        host = "${lookup(rule.value, "sub_domain", "")}${lookup(rule.value, "domain", var.domain_name)}"
        http {
          path {
            path      = lookup(rule.value, "path", null)
            path_type = lookup(rule.value, "path_type", var.path_type)
            backend {
              service_name = lookup(rule.value, "service_name", var.service_name)
              service_port = rule.value.external_port
            }
          }
        }
      }
    }
    dynamic "tls" {
      for_each = var.tls
      content {
        secret_name = tls.value
      }
    }
    dynamic "tls" {
      for_each = var.tls_hosts
      content {
        secret_name = tls.value.secret_name
        hosts       = tls.value.hosts
      }
    }
  }
}