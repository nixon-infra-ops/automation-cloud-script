output "current-client-configuration" {
  value = data.azurerm_client_config.current
}

output "appservice-plan" {
  value = data.azurerm_service_plan.objects
}