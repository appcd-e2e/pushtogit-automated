variable "region" {
  description = "AWS region in which the project needs to be setup (us-east-1, ca-west-1, eu-west-3, etc)"
}

variable "name" {
  default     = "eks-cluster-iamrole"
  description = "The name of the role"
  type        = "string"
  nullable    = true
  sensitive   = false
}

