
# App Service Plan
resource "azurerm_service_plan" "objects" {
  name                = local.planname
  resource_group_name = azurerm_resource_group.objects.name
  location            = azurerm_resource_group.objects.location
  os_type             = var.plan_os_type
  sku_name            = var.plan_sku_name
  tags                = var.concat_app_service_tags
}
