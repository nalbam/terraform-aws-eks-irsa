# eks

terraform {
  backend "s3" {
    region         = "ap-northeast-2"
    bucket         = "terraform-workshop-082867736673"
    key            = "eks-demo-irsa.tfstate"
    dynamodb_table = "terraform-resource-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
}

module "irsa" {
  source = "../../"

  region = var.region

  name = "eks-demo--irsa-demo"

  cluster_name = "eks-demo"

  cluster_names = [
    "eks-demo"
  ]

  kube_namespace      = "demo"
  kube_serviceaccount = "demo"

  policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
  ]
}
