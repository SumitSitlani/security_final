resource "azurerm_resource_group" "NetworkRG" {
  name     = var.rg-network-name
  location = var.location
}

resource "azurerm_resource_group" "LinuxRG" {
  name     = var.rg-linux-name
  location = var.location
}

resource "azurerm_resource_group" "WindowsRG" {
  name     = var.rg-windows-name
  location = var.location
}