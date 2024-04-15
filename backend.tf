terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01580173RG"
    storage_account_name = "tfstaten01580173sa"
    container_name       = "tfstatefiles"
    key                  = "tfstate"
  }
}