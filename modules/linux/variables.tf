variable "vm_name" {}

variable "size" {}

variable "admin-username" {
  default = "sumitsitlani"
}

variable "pub_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "priv_key" {
  default = "~/.ssh/id_rsa"
}

variable "os_disk_attr" {
  type = map(string)
  default = {
    "os_storage_account_type" = "Premium_LRS"
    "os_disk_size"            = "32"
    "os_disk_caching"         = "ReadWrite"
  }
}

variable "linux_publisher" {
  default = "Canonical"
}

variable "linux_offer" {
  default = "UbuntuServer"
}

variable "linux_sku" {
  default = "19.04"
}

variable "linux_version" {
  default = "latest"
}

locals {
  common_tags = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    ContactEmail = "n01580173@humber.ca"
    Environment  = "Lab"
  }
}

variable "linux_avs" {
  default = "linux_avs"
}

variable "nb_count" {}
variable "location" {}
variable "rg-name" {}
variable "subnetid" {}