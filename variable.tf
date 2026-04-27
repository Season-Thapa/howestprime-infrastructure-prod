variable "howestprime_subscription_id" {
  description = "The Azure Subscription ID"
  type        = string
}

variable "howestprime_tenant_id" {
  description = "The Azure Tenant ID"
  type        = string
}

variable "service_principal_terraform_client_id" {
  description = "The Client ID (App ID) of the Terraform Service Principal"
  type        = string
}

variable "service_principal_terraform_secret" {
  description = "The Client Secret of the Terraform Service Principal"
  type        = string
  sensitive   = true
}

variable "service_principal_terraform_sp_id" {
  description = "The Object ID of the Terraform Service Principal"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}

variable "resource_names" {
  description = "Map of resource names to assign to the resources."
  type        = map(string)
}
variable "cloudamqp_api_token" {
  description = "API token for CloudAMQP"
  type        = string
  sensitive   = true
}

