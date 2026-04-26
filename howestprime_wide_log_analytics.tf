resource "azurerm_log_analytics_workspace" "howestprime" {
  name                = var.resource_names["log_analytics_workspace"]
  location            = var.location
  resource_group_name = var.resource_names["azurerm_resource_group_howestprime"]

}