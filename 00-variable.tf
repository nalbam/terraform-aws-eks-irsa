# variable

variable "region" {
  description = "The region to deploy the cluster in, e.g: us-east-1"
}

variable "name" {
  description = "Name of the role, e.g: eks-demo-role"
}

variable "cluster_name" {
  description = "Name of the cluster, e.g: eks-demo"
  default     = ""
}

variable "cluster_names" {
  type    = list(string)
  default = []
}

variable "kube_namespace" {
  default = ""
}

variable "kube_serviceaccount" {
  default = ""
}

variable "service_account_arns" {
  type    = list(string)
  default = []
}

variable "policy_document" {
  default = ""
}

variable "policy_arns" {
  type    = list(string)
  default = []
}
