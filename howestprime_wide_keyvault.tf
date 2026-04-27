resource "azurerm_key_vault" "howestprime" {
  name                            = var.resource_names["azurerm_key_vault_howestprime"]
  location                        = azurerm_resource_group.howestprime.location
  resource_group_name             = azurerm_resource_group.howestprime.name
  tenant_id                       = var.howestprime_tenant_id
  sku_name                        = "standard"

  soft_delete_retention_days      = 7
  purge_protection_enabled        = false
  enabled_for_disk_encryption     = true
  enabled_for_deployment          = true
  enabled_for_template_deployment = true
    enable_rbac_authorization       = true
}

resource "azurerm_role_assignment" "terraform_kv_admin" {
  scope                = azurerm_key_vault.howestprime.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = var.service_principal_terraform_sp_id

  # Ensure Key Vault exists before assignment
  depends_on = [
    azurerm_key_vault.howestprime
  ]
}

