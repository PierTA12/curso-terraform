resource "azurecaf_name" "rg_name" {
  name          = "amines"
  resource_type = "azurerm_resource_group"
  prefixes      = ["dev"]
  suffixes      = ["y", "z"]
  random_length = 3
  clean_input   = true
}
resource "azurerm_resource_group" "sc1" {
  name     = azurecaf_name.rg_name.result
  location = "East US 2"
}
/*
resource "azurecaf_name" "storage_name" {
  name = "amines"
  resource_type = "azurerm_storage_account"
  prefixes = ["dev"]       
  random_length = 3
  clean_input = true
}
resource "azurerm_storage_account" "storage_account" {
  name                     = azurecaf_name.storage_name.result
  resource_group_name      = azurerm_resource_group.sc1.name
  location                 = azurerm_resource_group.sc1.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  public_network_access_enabled = false

  tags = {
    environment = "staging"
  }
}*/
