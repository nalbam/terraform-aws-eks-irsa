# variable

variable "region" {
  description = "The region to deploy the cluster in, e.g: us-east-1"
}

variable "name" {
  description = "Name of the role, e.g: eks-demo-role"
}

variable "cluster_name" {
  description = "Name of the cluster, e.g: eks-demo"
}

variable "kube_namespace" {
}

variable "kube_serviceaccount" {
}

variable "policy_document" {
}
