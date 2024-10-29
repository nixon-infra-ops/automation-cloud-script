
# Storage Account
resource "azurerm_storage_account" "objects" {
  name                     = local.storageaccountname
  resource_group_name      = azurerm_resource_group.objects.name
  location                 = azurerm_resource_group.objects.location
  account_tier             = var.storageaccount_account_tier
  account_replication_type = var.storageaccount_account_replication_type
  tags                     = var.concat_app_service_tags
}
