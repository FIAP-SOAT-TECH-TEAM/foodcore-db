# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server
# https://learn.microsoft.com/en-us/azure/developer/terraform/deploy-postgresql-flexible-server-database?tabs=azure-cli

resource "azurerm_network_security_group" "db_nsg" {
  name                = "${var.dns_prefix}-db-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowPostgresIngress"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5432"
    source_address_prefix      = var.vnet_aks_subnet_prefix[0]
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "db_assoc" {
  subnet_id                 = var.db_subnet_id
  network_security_group_id = azurerm_network_security_group.db_nsg.id
}

resource "azurerm_postgresql_flexible_server" "psqlflexibleserver" {
  name                          = "${var.dns_prefix}-psqlflexibleserver"
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = var.db_version
  administrator_login           = var.administrator_login
  administrator_password        = var.administrator_password
  storage_mb                    = var.db_storage_mb
  sku_name                      = var.db_sku_name
  delegated_subnet_id           = var.db_subnet_id
  private_dns_zone_id           = var.private_dns_zone_id
  public_network_access_enabled = false
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