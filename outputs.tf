output "load_balancer_ingress_ip" {
  value = kubernetes_ingress.ingress.load_balancer_ingress.*.ip
}

output "load_balancer_ingress_hostname" {
  value = kubernetes_ingress.ingress.load_balancer_ingress.*.hostname
}

output "id" {
  value = kubernetes_ingress.ingress.id
}

output "urls" {
  value = kubernetes_ingress.ingress.spec[*].rule[*].host
}