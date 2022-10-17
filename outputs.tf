output "id" {
  value = var.ingress_v1_enable ? kubernetes_ingress_v1.ingress[0].id : kubernetes_ingress.ingress[0].id
}

output "urls" {
  value = var.ingress_v1_enable ? kubernetes_ingress_v1.ingress[0].spec[*].rule[*].host : kubernetes_ingress.ingress[0].spec[*].rule[*].host
}