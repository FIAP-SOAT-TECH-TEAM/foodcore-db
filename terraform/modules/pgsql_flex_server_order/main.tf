# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server
# https://learn.microsoft.com/en-us/azure/developer/terraform/deploy-postgresql-flexible-server-database?tabs=azure-cli

resource "azurerm_postgresql_flexible_server" "psqlflexibleserver_order" {
  name                          = "${var.dns_prefix}-psqlflexibleserver-order"
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = var.pgsql_flex_db_version
  administrator_login           = var.pgsql_flex_administrator_login
  administrator_password        = var.pgsql_flex_administrator_password
  storage_mb                    = var.pgsql_flex_db_storage_mb
  sku_name                      = var.pgsql_flex_db_sku_name
  delegated_subnet_id           = var.pgsql_flex_subnet_id
  private_dns_zone_id           = var.pgsql_flex_private_dns_zone_id
  zone                          = var.pgsql_flex_db_zone
  public_network_access_enabled = false

  high_availability {
    mode = "ZoneRedundant"
    standby_availability_zone = var.pgsql_flex_ha_zone
  }

  # Ignora alterações nessas propriedades para evitar recriações desnecessárias
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server#zone
  lifecycle {
    ignore_changes = [
      zone,
      high_availability[0].standby_availability_zone
    ]
  }
}

resource "azurerm_postgresql_flexible_server_database" "foodcore_pgsql_database_order" {
  name      = "${var.dns_prefix}-db-order"
  server_id = azurerm_postgresql_flexible_server.psqlflexibleserver_order.id
  collation = var.pgsql_flex_db_collation
  charset   = var.pgsql_flex_db_charset

  lifecycle {
    prevent_destroy = false # Permitir a destruição do banco de dados (apenas para fins da atividade)
  }
}