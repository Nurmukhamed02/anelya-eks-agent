#=========================== eks_cluster/variables.tf ===============================

variable "env" {
  description = "Environment name to create resource in."
  type        = string
  default     = "DEV"
}

variable "eks_name" {
  description = "EKS Cluster name."
  type        = string
  default     = "EKS"
}

variable "eks_version" {
  description = "EKS Cluster version."
  type        = string
  default     = "1.22"
}

# variable "subnets" {
#   type = list(string)
#   default = 
#   }

variable "node_groups" {
  type    = any
  default = {}
}

variable "workers_group_default" {
  type    = any
  default = {}
}

# variable "vpc_id" {
#   type = string
#   default = "vpc-063cca0c6f2449305"
# }

