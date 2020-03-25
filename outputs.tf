output "load_balancer_ingress_ip" {
  value = kubernetes_ingress.ingress.load_balancer_ingress[0].ip
}

output "load_balancer_ingress_hostname" {
  value = kubernetes_ingress.ingress.load_balancer_ingress[0].hostname
}

output "id" {
  value = kubernetes_ingress.ingress.id
}