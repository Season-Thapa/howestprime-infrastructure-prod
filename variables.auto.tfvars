howestprime_subscription_id = "b1c90297-7a90-46a2-90df-79b267162848"
howestprime_tenant_id       = "99622af8-17ec-4e14-ab2a-d09b009df684"

location = "francecentral"
resource_names = {
  azurerm_resource_group_howestprime = "howestprime-wide-p-arg"
  azurerm_key_vault_howestprime      = "howestprime-wide-kv-100"
  azurerm_acr_howestprime            = "howestprimeacrseason10"
  azuread_application_github-ci-app  = "howestprime-github-ci"
  cloudamqp_instance_howestprime     = "howestprime-message-broker-100"
  log_analytics_workspace            = "howestprime-law-001"
  container_env                      = "howestprime-container-env-001"
   azurerm_user_assigned_identity_keyvaultreader = "howestprime-keyvaultreader-mi"
  azurerm_postgresql_flexible_server_movies = "howestprime-movies-db-st"

}
# In real life, this would be a list of IP ranges for the Azure services that need access to the database.
# But for the sake of simplicy and to easily connect from multiple locations, we will allow all IP ranges.
usernames = {
  howestprime_microservice_movies_db = "movies_admin"
}
howestprime_allowed_ip_ranges = [
  {
    name             = "allow_all"
    start_ip_address = "0.0.0.0"
    end_ip_address   = "255.255.255.255"
  }
]