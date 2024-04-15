provider "vault" {
  address = "http://127.0.0.1:8200"
}

data "vault_generic_secret" "azure_details" {
  path = "secret/azure"
}