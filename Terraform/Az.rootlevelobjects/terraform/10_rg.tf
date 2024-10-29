# Resource Group
resource "azurerm_resource_group" "objects" {
  name     = local.rgname
  location = var.resource_location
  tags     = var.concat_app_service_tags
}
