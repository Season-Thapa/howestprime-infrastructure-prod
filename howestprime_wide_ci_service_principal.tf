resource "azuread_application" "github-ci-app" {
  display_name = var.resource_names["azuread_application_github-ci-app"]
}

resource "time_rotating" "days" {
  rotation_days = 180
}

resource "azuread_application_password" "github-ci-app-password" {
  application_id      = azuread_application.github-ci-app.id
  rotate_when_changed = { rotation = time_rotating.days.id }
}

resource "azuread_service_principal" "github-ci-sp" {
  client_id = azuread_application.github-ci-app.client_id
  owners    = [var.service_principal_terraform_sp_id]
}
resource "azurerm_role_assignment" "github-ci-acr-push" {
  scope                = azurerm_container_registry.howestprime.id
  role_definition_name = "AcrPush"
  principal_id         = azuread_service_principal.github-ci-sp.object_id

  depends_on = [azurerm_key_vault.howestprime]
}

resource "azurerm_role_assignment" "github-ci-rg-contributor" {
  scope                = azurerm_resource_group.howestprime.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.github-ci-sp.object_id

  depends_on = [azurerm_key_vault.howestprime]
}