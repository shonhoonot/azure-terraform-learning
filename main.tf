terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "rg" {
  source   = "./modules/resource_group"
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "main" {
  name                     = var.storage_name
  resource_group_name      = module.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}