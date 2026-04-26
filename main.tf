terraform {
  required_version = "~> 1.14.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.61.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0.0"
    }
        cloudamqp = {
      source  = "cloudamqp/cloudamqp"
      version = "~>1.42"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }

  # These are needed so Terraform can register the container apps provider
  resource_providers_to_register = ["Microsoft.App"]

  subscription_id = var.howestprime_subscription_id
  tenant_id       = var.howestprime_tenant_id
  client_id       = var.service_principal_terraform_client_id
  client_secret   = var.service_principal_terraform_secret
}

provider "azuread" {
  tenant_id = var.howestprime_tenant_id
}
provider "cloudamqp" {
  apikey = var.cloudamqp_api_token
}