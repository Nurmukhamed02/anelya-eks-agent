
data "aws_vpc" "default" {
   default = true
} 

data "aws_subnets" "example" {
  filter {
    name = "tag:Name"
    values = [ "test-subnet-private" ]
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAVQFYR4BYSBOCEQHM"
  secret_key = "Fz3W++jaopJG4h5Q7AI9WwBhYlz8xiQK0S+myk96"
}


module "eks" {
  source = "./modules"

  vpc_id          = data.aws_vpc.default.id
  cluster_name    = var.eks_name
  cluster_version = var.eks_version
  env             = var.env
  subnet_ids      = data.aws_subnets.example.ids

  node_groups = {
    first = {
      node_group_name = "test"
      desired_size    = 3
      max_size        = 4
      min_size        = 2

      ami_type       = "AL2_x86_64"
      instance_types = ["t2.micro"]
    },
  }
}
