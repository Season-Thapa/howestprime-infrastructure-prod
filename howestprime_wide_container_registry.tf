resource "azurerm_container_registry" "howestprime" {
  name                = var.resource_names["azurerm_acr_howestprime"]
  resource_group_name = azurerm_resource_group.howestprime.name
  location            = azurerm_resource_group.howestprime.location
  sku                 = "Basic"
  admin_enabled       = false
}