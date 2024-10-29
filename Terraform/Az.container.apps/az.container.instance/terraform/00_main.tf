# Data block to retrieve the existing Container App Environment
data "azurerm_container_app_environment" "existing" {
  name                = var.allocated_container_app_environment_name
  resource_group_name = var.allocated_resource_group_for_container_environment
}

# Resource Group for Container App
resource "azurerm_resource_group" "objects" {
  name     = var.resource_group_name
  location = var.resource_group_location
  tags     = var.concat_app_service_tags
}

resource "azurerm_container_app" "objects" {
  name                         = var.name
  container_app_environment_id = data.azurerm_container_app_environment.existing.id
  resource_group_name          = azurerm_resource_group.objects.name 
  revision_mode                = var.revision_mode
  tags                         = var.concat_app_service_tags

 template {
    container {
      name   = "kplatuserportalcontainerapp"
      image  = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }
  ingress {
    external_enabled = true
    target_port      = 80

    traffic_weight {
      percentage     = 80
      revision_suffix = "production"  # 80% of traffic goes to revision v1
    }

    traffic_weight {
      percentage     = 20
      revision_suffix = "development"  # 20% of traffic goes to revision v2
    }
  }

    identity {
     type = "SystemAssigned"
    }

}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "objects" {
  name                       = var.kvname
  resource_group_name        = azurerm_resource_group.objects.name 
  location                   = azurerm_resource_group.objects.location
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = 7
  sku_name                   = "standard"
  tags                        = var.concat_app_service_tags

  enable_rbac_authorization = true

  enabled_for_disk_encryption = true
  purge_protection_enabled    = false
}
