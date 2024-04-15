resource "azurerm_virtual_network" "network-vnet" {
  name                = var.vnet-name
  location            = var.location
  resource_group_name = var.rg-name
  address_space       = var.vnet-address-space
}

resource "azurerm_subnet" "network-subnet1" {
  name                 = var.subnet1-name
  resource_group_name  = var.rg-name
  virtual_network_name = azurerm_virtual_network.network-vnet.name
  address_prefixes     = var.subnet1-add-space
}

resource "azurerm_network_security_group" "nsg1" {
  name                = var.nsg1-name
  location            = var.location
  resource_group_name = var.rg-name

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "subnet1-association" {
  subnet_id                 = azurerm_subnet.network-subnet1.id
  network_security_group_id = azurerm_network_security_group.nsg1.id
}

resource "azurerm_subnet" "network-subnet2" {
  name                 = var.subnet2-name
  resource_group_name  = var.rg-name
  virtual_network_name = azurerm_virtual_network.network-vnet.name
  address_prefixes     = var.subnet2-add-space
}

resource "azurerm_network_security_group" "nsg2" {
  name                = var.nsg2-name
  location            = var.location
  resource_group_name = var.rg-name

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "rule2"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "subnet2-association" {
  subnet_id                 = azurerm_subnet.network-subnet2.id
  network_security_group_id = azurerm_network_security_group.nsg2.id
}