# Define the location where resources will be created
variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
  default     = "West US 2"
}

# Define the name of the resource group
variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "rg-kii-es-containerapps"
}

# Define the name of the Container Apps environment
variable "container_app_environment_name" {
  description = "The name of the Container Apps environment."
  type        = string
  default     = "cae-kii-es-containerapps"
}

variable "concat_app_service_tags" {
  description = "App Service Tags"
  type        = map(any)
}


variable "allocated_resource_group_for_loganalyticsworkspace" {
  description = "Resource Group Name of allocated Log Analytics Workspace"
  type        = string
}

variable "allocated_log_analytics_workspace_name" {
  description = "Log Analytics Workspace Name"
  type        = string
}