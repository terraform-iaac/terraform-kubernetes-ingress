variable "internal_web_port" {
  default = [
    {
      sub_domain    = "jenkins."     //(Optional) ( subdomain must consist " . " in the end)
      path          = "/jenkins-dev" //(Optional) (Path in url)
      internal_port = "8080"         //(Required) Internal pod port
    },
    {
      sub_domain    = "jenkins."      //(Optional) ( subdomain must consist " . " in the end)
      path          = "/jenkins-prod" //(Optional) (Path in url)
      internal_port = "9090"          //(Required) Internal pod port
    },
    {
      domain        = "another.com" //(Optional) (Redefine domain for this url) (Important! by default will use var.domain_name, if this field empty)
      internal_port = "9090"        //(Required) Internal pod port
    },
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
