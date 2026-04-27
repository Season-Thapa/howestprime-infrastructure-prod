data "azuread_client_config" "current" {}

resource "azuread_application" "github_ci_cd" {
  display_name = var.resource_names["github_ci_cd_app"]
}

resource "time_rotating" "github_secret_rotation" {
  rotation_days = 180
}

resource "azuread_application_password" "github_ci_cd_secret" {
  # In the newer AzureAD provider, it's safer to use the application's object_id directly
  application_id = azuread_application.github_ci_cd.id 
  display_name   = "github-ci-cd-secret"
  
  rotate_when_changed = {
    rotation = time_rotating.github_secret_rotation.id
  }

  # FIX FOR THE WARNING: Add 4320 hours (180 days) to the rotation timestamp
  end_date = timeadd(time_rotating.github_secret_rotation.id, "4320h")
}

resource "azuread_service_principal" "github_ci_cd_sp" {
  client_id = azuread_application.github_ci_cd.client_id
  owners    = [data.azuread_client_config.current.object_id]
}