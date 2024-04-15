variable "os_disk_attr_windows" {
  type = map(string)
  default = {
    "os_storage_account_type" = "StandardSSD_LRS"
    "os_disk_size"            = "128"
    "os_disk_caching"         = "ReadWrite"
  }
}

variable "windows_name" {
  type = map(string)
  default = {
    "n01580173-w-vm1" = "Standard_B1s"
    "n01580173-w-vm2" = "Standard_B1ms"
  }
}

variable "windows_publisher" {
  default = "MicrosoftWindowsServer"
}

variable "windows_offer" {
  default = "WindowsServer"
}

variable "windows_sku" {
  default = "2016-Datacenter"
}

variable "windows_version" {
  default = "latest"
}

variable "windows_avs" {
  default = "windows_avs"
}

variable "admin_password" {
  default = "LetMeInItsAdmin@"
}

variable "location" {}
variable "rg-name" {}
variable "subnetid" {}

variable "admin-username" {
  default = "sumitsitlani"
}