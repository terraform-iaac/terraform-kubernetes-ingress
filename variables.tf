variable "app_name" {
  description = "(Required) Application name for attach to ingress"
}
variable "app_namespace" {
  description = "(Required) Namespace where located application"
}
variable "web_internal_port" {
  description = "(Required) Container port, ingress will redirect request to this port"
}
variable "domain_name" {
  description = "(Required) Domain name for URL access ( example: google.com). Also could add subdomain ( example: subdomain.domainname.com). And path for access ( example: domain.com/path )"
}
variable "tls" {
  description = "(Optional) Enable https traffic & and include SSL Certificate"
  default = []
}
variable "annotations" {
  description = "(Optional) Custom Annotations"
  default = {
    "kubernetes.io/ingress.class" = "nginx"
  }
}