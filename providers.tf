terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.87.0"
    }
  }
}

provider "azurerm" {
  subscription_id = data.vault_generic_secret.azure_details.data["subscription_id"]
  tenant_id = data.vault_generic_secret.azure_details.data["tenant_id"]
  client_id = data.vault_generic_secret.azure_details.data["client_id"]
  client_secret = data.vault_generic_secret.azure_details.data["client_secret"]
  features {
    
  }
}