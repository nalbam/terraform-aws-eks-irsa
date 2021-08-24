# variable

variable "cluster_name" {
  type = string
}

variable "provider_url" {
  type = string
}

variable "irsa_name" {
  type    = string
  default = ""
}

variable "irsa_desc" {
  type    = string
  default = ""
}

variable "service_name" {
  type = string
}

variable "namespace" {
  type    = string
  default = ""
}

variable "service_account" {
  type    = string
  default = ""
}

variable "iam_policy" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
