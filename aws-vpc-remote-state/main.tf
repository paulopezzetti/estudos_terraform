terraform {
  required_version = ">= 1.1.0"

  required_providers {
    aws = {
      version = ">= 3.73.0"
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "exemplo-criacao-bucket-terraform"
    key    = "aws-cpc/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "paulo.pezzetti"
      managed-by = "terraform"
    }
  }
}

