terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

backend "azurerm" {
  subscription_id      = "702e2323-a444-4093-8f18-ca43576dea38"
  resource_group_name  = "tfstate-rg"
  storage_account_name = "tfstate2026x"
  container_name       = "tfstate"
  key                  = "terraform.tfstate"
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