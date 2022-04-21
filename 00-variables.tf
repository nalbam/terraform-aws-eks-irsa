# variable

variable "cluster_name" {
  type    = string
  default = null
}

variable "cluster_group" {
  type    = string
  default = null
}

variable "cluster_names" {
  type    = list(string)
  default = null
}

variable "irsa_name" {
  type    = string
  default = null
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

variable "iam_policy_desc" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map(string)
  default = {}
}
