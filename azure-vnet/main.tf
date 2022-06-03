terraform {

  required_providers {
    azurerm = {
      version = ">= 0.9.0"
      source  = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {
    resource_group_name  = "remote-state"
    storage_account_name = "remotestatepezzetti"
    container_name       = "remote-state"
    key                  = "azure-vnet/terraform.tfstate"

  }
}

provider "azurerm" {
  features {}
}


