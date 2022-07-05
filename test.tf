 terraform {
  backend "s3" {
    bucket   = "terraform-amcp-live-sync"
    key      = "terraform/kid"
    region   = "ap-southeast-2"
 
  }
}


terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.21.0"
    }
  }
}

provider "aws" {
 region = "ap-southeast-2"
 
  assume_role {
    role_arn = "arn:aws:iam::461554162639:role/ec2-iamprofile"
  }
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"
}

  
