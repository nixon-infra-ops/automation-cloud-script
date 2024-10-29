# Load data of existing app sevice defined in "00_commons_vars.tf"
data "azurerm_mssql_server" "objects" {
  name                = var.allocated_mssql_database_name
  resource_group_name = var.allocated_resource_group_for_sql
}

resource "azurerm_mssql_database" "objects" {
  name           = local.sqldbname
  server_id      = data.azurerm_mssql_server.objects.id
  collation      = var.sqldb_collation
  max_size_gb    = var.sqldb_max_size_gb
  sku_name       = var.sqldb_sku_name
  read_scale     = var.sqldb_read_scale
  zone_redundant = var.sqldb_zone_redundant
  tags           = var.concat_app_service_tags
}
