# Data block to fetch the Key Vault information
data "azurerm_key_vault" "azure_vault" {
  name                = var.keyvault_name
  resource_group_name = var.keyvault_rg
}

# Data block to get the Service Principal ID from the Key Vault
data "azurerm_key_vault_secret" "spn_id" {
  name         = var.clientidkvsecret
  key_vault_id = data.azurerm_key_vault.azure_vault.id
}

# Data block to get the Service Principal Secret from the Key Vault
data "azurerm_key_vault_secret" "spn_secret" {
  name         = var.spnkvsecret
  key_vault_id = data.azurerm_key_vault.azure_vault.id
}

# Azure Container Registry resource
resource "azurerm_container_registry" "diwaacr" {
  name                = var.acrname
  resource_group_name = var.rg_name
  location            = var.rg_location
  sku                 = "Basic"
  admin_enabled       = true
}

# Role assignment to grant the ACR Pull role
resource "azurerm_role_assignment" "acrpull_role" {
  principal_id                     = data.azurerm_key_vault_secret.spn_id.value
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.diwaacr.id
  skip_service_principal_aad_check = true
}
