output "id" {
  value = var.ingress_v1_enable ? kubernetes_ingress_v1.ingress.id : kubernetes_ingress.ingress.id
}

output "urls" {
  value = var.ingress_v1_enable ? kubernetes_ingress_v1.ingress.spec[*].rule[*].host : kubernetes_ingress.ingress.spec[*].rule[*].host
}