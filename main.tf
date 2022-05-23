terraform {
    required_version = "~> 1.0.0"

    required_providers {
      aws = {
        version = ">= 3.50.0"
        source  = "hashicorp/aws"
      }
      azurerm = {
        version = ">= 2.70.0"
        source  = "hashicorp/azurerm"
      }
    backend "s3"{

        }
    }

}


provider "aws" {
  
}

resource "aws_instance" "vm1" {
  
}

data "aws_ami" "ami" {
  
}

module "vpc" {
  
}

variable "ip" {
  
}

output "vm1_ip" {
  
}

locals {
  
}