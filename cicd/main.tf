provider "azurerm" {
  features {}
  subscription_id = "dc3cb78e-1ebc-4d4f-b2f6-59c33c68369a"
}

resource "azurerm_resource_group" "rg" {
  name     = "cicd-group"
  location = "eastus2"
}

resource "azurerm_storage_account" "storage" {
  name                     = "continousdeployment"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "example" {
  name                  = "containerdeployment"
  storage_account_id = azurerm_storage_account.storage.id
  container_access_type = "container"
}