output "id" {
  value = kubernetes_ingress.ingress.id
}

output "urls" {
  value = kubernetes_ingress.ingress.spec[*].rule[*].host
}