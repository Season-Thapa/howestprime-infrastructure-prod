resource "azurerm_user_assigned_identity" "keyvaultreader" {
  name                = var.resource_names["azurerm_user_assigned_identity_keyvaultreader"]
  location            = var.location
  resource_group_name = azurerm_resource_group.howestprime.name
}

resource "azurerm_role_assignment" "keyvaultreader_secrets_officer" {
  scope                = azurerm_key_vault.howestprime.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = azurerm_user_assigned_identity.keyvaultreader.principal_id

  depends_on = [azurerm_key_vault.howestprime]
}