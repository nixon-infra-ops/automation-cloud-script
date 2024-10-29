# Azure Container Registry
resource "azurerm_container_registry" "objects" {
  count               = var.concat_environment == "prod" ? 1 : 0  # Conditionally create the resource for "prod" environment
  name                = var.concat_environment == "prod" ? local.acrname : null
  resource_group_name = var.concat_environment == "prod" ? azurerm_service_plan.objects.resource_group_name : null
  location            = var.concat_environment == "prod" ? azurerm_service_plan.objects.location : null
  sku                 = var.concat_environment == "prod" ? var.acr_sku_name : null
  admin_enabled       = var.concat_environment == "prod" ? true : null
  tags                = var.concat_app_service_tags

  identity {
    type = "SystemAssigned"
  }

}

