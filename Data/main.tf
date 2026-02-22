data "azurerm_resource_group" "imported_rg" {
  name = "GrupoPrevio"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "almacenprevio"
  location                 = "East US 2"
  resource_group_name      = data.azurerm_resource_group.imported_rg.name
  account_tier             = "Standard"
  account_replication_type = "GRS"
}