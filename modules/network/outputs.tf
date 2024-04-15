output "NetworkVNet" {
  value = azurerm_virtual_network.network-vnet
}

output "Subnet1" {
  value = azurerm_subnet.network-subnet1
}

output "Subnet2" {
  value = azurerm_subnet.network-subnet2
}
