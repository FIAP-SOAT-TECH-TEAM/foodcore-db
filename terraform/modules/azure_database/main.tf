resource "azurerm_postgresql_flexible_server" "psqlflexibleserver" {
  name                   = "${var.dns_prefix}-psqlflexibleserver"
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = var.db_version
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  storage_mb             = var.db_storage_mb
  sku_name               = var.db_sku_name
}

resource "azurerm_postgresql_flexible_server_database" "foodcore_pgsql_database" {
  name      = "${var.dns_prefix}-db"
  server_id = azurerm_postgresql_flexible_server.psqlflexibleserver.id
  collation = var.db_collation
  charset   = var.db_charset

  lifecycle {
    prevent_destroy = false # Permitir a destruição do banco de dados (apenas para fins da atividade)
  }
}