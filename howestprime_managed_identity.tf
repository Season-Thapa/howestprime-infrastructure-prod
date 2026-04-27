resource "azurerm_user_assigned_identity" "movies_ticketing" {
  name                = var.resource_names["movies_ticketing_managed_identity"]
  location            = var.location
  resource_group_name = azurerm_resource_group.howestprime.name
}

resource "azurerm_role_assignment" "movies_ticketing_kv" {
  scope                = azurerm_key_vault.howestprime.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = azurerm_user_assigned_identity.movies_ticketing.principal_id

  depends_on = [azurerm_key_vault.howestprime]
}