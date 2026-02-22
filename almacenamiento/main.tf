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

resource "azurerm_resource_group" "sc1" {
  name     = "grupodealmacenamiento"
  location = "East US 2"
}
resource "azurerm_storage_account" "storage_account" {
  name                          = "firststorageacctstg"
  resource_group_name           = azurerm_resource_group.sc1.name
  location                      = azurerm_resource_group.sc1.location
  account_tier                  = "Standard"
  account_replication_type      = "GRS"
  public_network_access_enabled = false

  tags = {
    environment = "staging"
  }
}
output "cadena_conexion" {
  value     = azurerm_storage_account.storage_account.primary_connection_string
  sensitive = true
}