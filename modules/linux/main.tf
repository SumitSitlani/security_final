resource "azurerm_availability_set" "linux_avs" {
  name                         = var.linux_avs
  location                     = var.location
  resource_group_name          = var.rg-name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
}

resource "azurerm_network_interface" "linux_nic" {
  name                = "${var.vm_name}-nic-${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.rg-name
  tags                = local.common_tags
  count               = var.nb_count

  ip_configuration {
    name                          = "${var.vm_name}-ipconfig-${format("%1d", count.index + 1)}"
    subnet_id                     = var.subnetid
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.linux_pip[*].id, count.index + 1)
  }
}

resource "azurerm_public_ip" "linux_pip" {
  name                = "${var.vm_name}-pip-${format("%1d", count.index + 1)}"
  resource_group_name = var.rg-name
  location            = var.location
  domain_name_label   = "${var.vm_name}-${format("%1d", count.index + 1)}"
  allocation_method   = "Dynamic"
  tags                = local.common_tags
  count               = var.nb_count
}

resource "azurerm_linux_virtual_machine" "vmlinux" {
  name                  = "${var.vm_name}-${format("%1d", count.index + 1)}"
  resource_group_name   = var.rg-name
  location              = var.location
  size                  = var.size
  admin_username        = var.admin-username
  network_interface_ids = [element(azurerm_network_interface.linux_nic[*].id, count.index + 1)]
  tags                  = local.common_tags
  count                 = var.nb_count
  availability_set_id = azurerm_availability_set.linux_avs.id

  admin_ssh_key {
    username   = var.admin-username
    public_key = file(var.pub_key)
  }

  os_disk {
    name                 = "${var.vm_name}-os-disk-${format("%1d", count.index + 1)}"
    caching              = var.os_disk_attr["os_disk_caching"]
    disk_size_gb         = var.os_disk_attr["os_disk_size"]
    storage_account_type = var.os_disk_attr["os_storage_account_type"]
  }

  source_image_reference {
    publisher = var.linux_publisher
    offer     = var.linux_offer
    sku       = var.linux_sku
    version   = var.linux_version
  }
}