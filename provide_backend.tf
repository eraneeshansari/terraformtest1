terraform {
  required_version = ">= 1.12"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "mys3backend23"
    key    = "s3_example/v1/terraform.tfstate"
    region = "ap-south-1"
    ### State Locking 
    use_lockfile = true
  }
}

provider "aws" {
  region = var.region
}
