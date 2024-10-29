resource "azurerm_key_vault" "objects" {
  name                       = local.kvname
  location                   = azurerm_resource_group.objects.location
  resource_group_name        = local.rgname
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = 7
  sku_name                   = "standard"

  enable_rbac_authorization = true

  enabled_for_disk_encryption = true
  purge_protection_enabled    = false
}
