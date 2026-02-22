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

import {
  to = azurerm_storage_account.mi_cuenta
  id = "/subscriptions/dc3cb78e-1ebc-4d4f-b2f6-59c33c68369a/resourceGroups/pruebastorage/providers/Microsoft.Storage/storageAccounts/pruebastorage23"
}

resource "azurerm_storage_account" "mi_cuenta" {
  name                     = "pruebastorage23"
  resource_group_name      = "pruebastorage"
  location                 = "eastus2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}