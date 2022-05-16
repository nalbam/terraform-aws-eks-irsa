# variable

variable "irsa_name" {
  type    = string
  default = null
}

variable "cluster_oidc_urls" {
  description = "Required"
  type        = list(string)
}

variable "cluster_name" {
  type    = string
  default = ""
}

variable "service_name" {
  type    = string
  default = ""
}

variable "namespace" {
  type    = string
  default = null
}

variable "service_account" {
  type    = string
  default = null
}

variable "iam_policy" {
  description = "Required"
  type        = string
}

variable "iam_policy_desc" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}
