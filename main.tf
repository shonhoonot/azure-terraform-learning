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

# for_each ашиглан dev, staging, prod үүсгэх
resource "azurerm_resource_group" "main" {
  for_each = toset(["dev", "staging", "prod"])
  name     = "rg-${each.key}"
  location = "japaneast"
}