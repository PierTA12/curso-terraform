terraform {
  backend "azurerm" {
    storage_account_name = "estadosterraformadmin"
    container_name       = "states"
    key                  = "estados.tfstate"
  }
}