resource "azurerm_resource_group" "objects" {
  name     = var.resource_group_name
  location = var.location

  tags = var.concat_app_service_tags
}

# Fetch existing Log Analytics workspace
data "azurerm_log_analytics_workspace" "existing" {
  name                = var.allocated_log_analytics_workspace_name
  resource_group_name = var.allocated_resource_group_for_loganalyticsworkspace
}

resource "azurerm_container_app_environment" "objects" {
  name                       = var.container_app_environment_name
  resource_group_name        = azurerm_resource_group.objects.name
  location                   = var.location
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.existing.id

  tags = var.concat_app_service_tags
}