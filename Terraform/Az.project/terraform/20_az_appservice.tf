# Load data of existing app sevice defined in "00_commons_vars.tf"
data "azurerm_service_plan" "objects" {
  name                = var.allocated_app_service_plan_name
  resource_group_name = var.allocated_resource_group_for_appserviceplan
}

resource "azurerm_linux_web_app" "objects" {
  name                = local.webappname
  resource_group_name = azurerm_resource_group.objects.name
  location            = data.azurerm_service_plan.objects.location
  service_plan_id     = data.azurerm_service_plan.objects.id
  tags                = var.concat_app_service_tags

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }

  site_config {
    application_stack {
      docker_image_name   = "nginx:latest"
      docker_registry_url = "https://index.docker.io"
    }
  }
  identity {
   type = "SystemAssigned"
  }
}


# Define the deployment slot
resource "azurerm_linux_web_app_slot" "objects" {
  count               = var.concat_environment == "prod" ? 1 : 0  # Deploy slot only if environment is "prod"
  name                = var.concat_environment == "prod" ? "swap" : null
  app_service_id     = var.concat_environment == "prod" ? azurerm_linux_web_app.objects.id  : null
  tags                = var.concat_app_service_tags

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }

  site_config {
    application_stack {
      docker_image_name   = "nginx:latest"
      docker_registry_url = "https://index.docker.io"
    }
  }
  identity {
   type = "SystemAssigned"
  }
}
