terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.58.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "dc3cb78e-1ebc-4d4f-b2f6-59c33c68369a"
}

resource "azurerm_resource_group" "rg1" {
  name     = var.rg_name
  location = "East US 2"
}