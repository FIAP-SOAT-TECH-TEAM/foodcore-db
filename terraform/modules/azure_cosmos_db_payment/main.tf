resource "azurerm_cosmosdb_account" "azcosmosdb_account_payment" {
  name                          = "${var.dns_prefix}-azcomosdb-account-payment"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  offer_type                    = var.azcosmosdb_offer_type
  kind                          = var.azcosmosdb_kind
  automatic_failover_enabled    = var.azcosmosdb_automatic_failover
  public_network_access_enabled = false
  
  geo_location {
    location          = var.location
    failover_priority = var.azcosmosdb_failover_priority
    zone_redundant    = var.azcosmosdb_zone_redundant
  }

  consistency_policy {
    consistency_level = var.azcosmosdb_consistency_level
  }
 
}

resource "azurerm_cosmosdb_sql_database" "azcosmosdb_db_payment" {
  name                = "${var.dns_prefix}-db-payment"
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.azcosmosdb_account_payment.name
}

resource "azurerm_private_endpoint" "cosmosdb_private_endpoint" {
  name                = "${var.dns_prefix}-cosmosdb-payment-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.azcosmosdb_subnet_id

  private_service_connection {
    name                           = "${var.dns_prefix}-cosmosdb-payment-psc"
    private_connection_resource_id = azurerm_cosmosdb_account.azcosmosdb_account_payment.id
    subresource_names              = ["Sql"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "${var.dns_prefix}-cosmosdb-payment-dns-zone-group"
    private_dns_zone_ids = [
      var.azcosmosdb_private_dns_id
    ]
  }
}