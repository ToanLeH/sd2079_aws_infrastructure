provider "aws" {
  region  = "ap-south-1"
  profile = "toanleh.devops.saml"
}

terraform {
  backend "s3" {
    bucket         = "terraform-boostrap-toanleh-devops-0002"
    key            = "rds.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-boostrap-toanleh-devops"
    profile        = "toanleh.devops.saml"
    encrypt        = true
    kms_key_id     = "b1b45efb-f826-4e50-be6c-a72ab7ad6e8c"
  }
}

data "terraform_remote_state" "bootstrap" {
  backend = "s3"
  config = {
    bucket  = "terraform-boostrap-toanleh-devops-0002"
    key     = "terraform.tfstate"
    profile = "toanleh.devops.saml"
    region  = "ap-south-1"
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"
  workspace = "dev"

  config = {
    bucket  = "terraform-boostrap-toanleh-devops-0002"
    key     = "network.tfstate"
    profile = "toanleh.devops.saml"
    region  = "ap-south-1"
  }
}

terraform {
  required_version = "~> 1.3.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.67.0"
    }
  }
}