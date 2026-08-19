terraform {
  required_version = ">= 1.6.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.70.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "sdn_rg"
    storage_account_name = "sdnstoragerg"
    container_name = "sdnstoragecon"
    key = "dev.terraform.tfstate"
    
  }
}
provider "azurerm" {
  features {}
}