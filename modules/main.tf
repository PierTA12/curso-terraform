resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = var.name
}

module "vnet" {
  source              = "./vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

module "nsg" {
  source              = "./nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

module "vm" {
  source              = "./vm"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  vm_admin_username   = var.vm_admin_username
  vm_admin_password   = var.vm_admin_password
  subnet_id           = module.vnet.subnet_id
  public_ip           = module.vnet.public_ip
  nsg_id              = module.nsg.nsg_id
}