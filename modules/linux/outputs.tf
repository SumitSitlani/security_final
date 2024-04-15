output "VMHostName" {
  value = [azurerm_linux_virtual_machine.vmlinux[*].computer_name]
}

output "VMFQDN" {
  value = [azurerm_public_ip.linux_pip[*].fqdn]
}

output "privateip" {
  value = [azurerm_linux_virtual_machine.vmlinux[*].private_ip_address]
}

output "publicip" {
  value = [azurerm_linux_virtual_machine.vmlinux[*].public_ip_address]
}
