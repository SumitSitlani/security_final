output "rg-network" {
  value = module.resource_group.network-rg.name
}

output "rg-linux" {
  value = module.resource_group.linux-rg.name
}

output "rg-windows" {
  value = module.resource_group.windows-rg.name
}

output "NetworkName" {
  value = module.network.NetworkVNet.name
}

output "NetworkAddressSpace" {
  value = module.network.NetworkVNet.address_space
}

output "SubnetName1" {
  value = module.network.Subnet1.name
}

output "SubnetName2" {
  value = module.network.Subnet2.name
}

output "SubnetAddressSpace1" {
  value = module.network.Subnet1.address_prefixes
}

output "SubnetAddressSpace2" {
  value = module.network.Subnet2.address_prefixes
}

output "LinuxVMNames" {
  value = module.linux.VMHostName
}

output "LinuxFQDN" {
  value = module.linux.VMFQDN
}

output "Linux_public_ip_addresses" {
  value = module.linux.publicip
}

output "Linux_private_ip_addresses" {
  value = module.linux.privateip
}

output "WindowsVMName" {
  value = module.windows.WindowsVMName
}

output "WindowsFQDN" {
  value = module.windows.WindowsFQDN
}

output "WindowsVMPrivateIP" {
  value = module.windows.WindowsVMPrivateIP
}

output "WindowsVMPublicIP" {
  value = module.windows.WindowsPublicIP
}
