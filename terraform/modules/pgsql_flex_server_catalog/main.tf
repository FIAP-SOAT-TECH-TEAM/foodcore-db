# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server
# https://learn.microsoft.com/en-us/azure/developer/terraform/deploy-postgresql-flexible-server-database?tabs=azure-cli

resource "azurerm_postgresql_flexible_server" "psqlflexibleserver_catalog" {
  name                          = "${var.dns_prefix}-psqlflexibleserver-catalog"
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = var.pgsql_flex_db_version
  administrator_login           = var.pgsql_flex_administrator_login
  administrator_password        = var.pgsql_flex_administrator_password
  storage_mb                    = var.pgsql_flex_db_storage_mb
  sku_name                      = var.pgsql_flex_db_sku_name
  delegated_subnet_id           = var.pgsql_flex_subnet_id
  private_dns_zone_id           = var.pgsql_flex_private_dns_zone_id
  public_network_access_enabled = false

  geo_redundant_backup_enabled  = true
  high_availability {
    # ZoneRedudant temporariamente desabilitada bloqueado na região Brazil South
    # https://learn.microsoft.com/en-us/azure/postgresql/flexible-server/overview#azure-regions
    mode = "SameZone"
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

resource "azurerm_postgresql_flexible_server_database" "foodcore_pgsql_database_catalog" {
  name      = "${var.dns_prefix}-db-catalog"
  server_id = azurerm_postgresql_flexible_server.psqlflexibleserver_catalog.id
  collation = var.pgsql_flex_db_collation
  charset   = var.pgsql_flex_db_charset

  lifecycle {
    prevent_destroy = false # Permitir a destruição do banco de dados (apenas para fins da atividade)
  }
}