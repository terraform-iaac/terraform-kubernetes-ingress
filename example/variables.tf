variable "internal_web_port" {
  default = [
    {
      sub_domain = "jenkins" //(Optional)
      path = "/jenkins-dev" //(Optional)
      internal_port = "8080" //(Required)
    },
    {
      sub_domain = "jenkins" //(Optional)
      path = "/jenkins-prod" //(Optional)
      internal_port = "9090" //(Required)
    }
  ]
}

variable "domain_name" {
  default = "example.com"
}

variable "app_name" {
  default = "jenkins"
}

variable "app_namespace" {
  default = "ci-tools"
}
