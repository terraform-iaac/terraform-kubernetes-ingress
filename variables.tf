variable "service_name" {
  type        = string
  description = "(Required) Application name for attach to ingress. Service name."
}
variable "service_namespace" {
  type        = string
  description = "(Required) Namespace where located service"
}
variable "rule" {
  description = "(Required) External Service port, ingress will redirect request to this service port.  Also could add subdomain ( example: subdomain.domainname.com). And path for access ( example: domain.com/path ). And redefine domain."
}
variable "domain_name" {
  type        = string
  description = "(Otional) Global domain name for all URL ( example: google.com)."
  default     = "example.com"
}
variable "tls" {
  type        = list(string)
  description = "(Optional) Enable https traffic & and include SSL Certificate"
  default     = []
}
variable "annotations" {
  description = "(Optional) Custom Annotations"
  default     = null
}
variable "ingress_class_name" {
  description = "Ingress Class name"
  type        = string
  default     = "nginx"
}
variable "tls_hosts" {
  description = "(Optional) Enable https traffic & and include SSL Certificate with hosts match"
  default     = []
}