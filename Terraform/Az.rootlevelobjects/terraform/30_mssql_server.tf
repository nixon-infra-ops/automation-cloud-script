
# Azure SQL Server
resource "azurerm_mssql_server" "objects" {
  name                         = local.sqlservername
  resource_group_name          = azurerm_resource_group.objects.name
  location                     = azurerm_resource_group.objects.location
  version                      = var.sqlserver_version
  administrator_login          = var.sqlserver_administrator_login
  administrator_login_password = var.sqlserver_administrator_login_password
  tags                         = var.concat_app_service_tags

    azuread_administrator {
      azuread_authentication_only = false
      login_username              = var.sqlserver_ad_login                       #"AzureSQLAdmins"
      object_id                   = var.sqlserver_ad_login_objid                 #"ab4668bc-9b8f-4b3d-9a35-b03c764ab966"
      tenant_id                   = data.azurerm_client_config.current.tenant_id #"1eb2716d-0dd3-4ae7-8d89-60b3faa22f6a"
    }
}




