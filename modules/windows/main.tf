resource "azurerm_availability_set" "windows_avs" {
  name                         = var.windows_avs
  location                     = var.location
  resource_group_name          = var.rg-name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
}

resource "azurerm_network_interface" "windows_nic" {
  for_each            = var.windows_name
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.rg-name

  ip_configuration {
    name                          = "${each.key}-ipconfig"
    subnet_id                     = var.subnetid
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.windows_pip[each.key].id
  }
}

resource "azurerm_public_ip" "windows_pip" {
  for_each            = var.windows_name
  name                = "${each.key}-pip"
  resource_group_name = var.rg-name
  location            = var.location
  domain_name_label   = each.key
  allocation_method   = "Dynamic"
}

resource "azurerm_windows_virtual_machine" "vmwindows" {
  for_each              = var.windows_name
  name                  = each.key
  resource_group_name   = var.rg-name
  location              = var.location
  size                  = each.value
  admin_username        = var.admin-username
  admin_password        = var.admin_password
  network_interface_ids = [azurerm_network_interface.windows_nic[each.key].id]
  availability_set_id = azurerm_availability_set.windows_avs.id

  winrm_listener {
    protocol = "Http"
  }

  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.os_disk_attr_windows["os_disk_caching"]
    disk_size_gb         = var.os_disk_attr_windows["os_disk_size"]
    storage_account_type = var.os_disk_attr_windows["os_storage_account_type"]
  }

  source_image_reference {
    publisher = var.windows_publisher
    offer     = var.windows_offer
    sku       = var.windows_sku
    version   = var.windows_version
  }
}