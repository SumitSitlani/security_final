output "WindowsAVSName" {
  value = azurerm_availability_set.windows_avs.name
}

output "WindowsVMName" {
  value = values(azurerm_windows_virtual_machine.vmwindows)[*].name
}

output "WindowsFQDN" {
  value = values(azurerm_public_ip.windows_pip)[*].fqdn
}

output "WindowsVMPrivateIP" {
  value = values(azurerm_windows_virtual_machine.vmwindows)[*].private_ip_address
}

output "WindowsPublicIP" {
  value = values(azurerm_windows_virtual_machine.vmwindows)[*].public_ip_address
}