terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
    subscription_id = "dc3cb78e-1ebc-4d4f-b2f6-59c33c68369a"
}

variable "rg_name" {
  type = string
  default = "GrupoRecursos"
}

locals {
  dev_name = "geanpierre${var.rg_name}"
}

resource "azurerm_resource_group" "rg" {
  location = "East US2"
  name     = local.dev_name
}