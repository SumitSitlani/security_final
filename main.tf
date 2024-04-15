module "resource_group" {
  source          = "./modules/resource_group"
  location        = "Canada Central"
  rg-network-name = "NetworkRG"
  rg-linux-name   = "LinuxRG"
  rg-windows-name = "WindowsRG"
}

module "network" {
  source             = "./modules/network"
  location           = module.resource_group.network-rg.location
  rg-name            = module.resource_group.network-rg.name
  vnet-name          = "network-vnet"
  vnet-address-space = ["10.0.0.0/16"]
  subnet1-name       = "network-subnet1"
  subnet2-name       = "network-subnet2"
  subnet1-add-space  = ["10.0.0.0/24"]
  subnet2-add-space  = ["10.0.1.0/24"]
  nsg1-name          = "network-nsg1"
  nsg2-name          = "network-nsg2"
}

module "linux" {
  source   = "./modules/linux"
  location = module.resource_group.linux-rg.location
  rg-name  = module.resource_group.linux-rg.name
  subnetid = module.network.Subnet1.id
  size     = "Standard_B1s"
  vm_name  = "n01580173-u-vm"
  nb_count = 2
}

module "windows" {
  source   = "./modules/windows"
  subnetid = module.network.Subnet2.id
  location = module.resource_group.windows-rg.location
  rg-name  = module.resource_group.windows-rg.name
}