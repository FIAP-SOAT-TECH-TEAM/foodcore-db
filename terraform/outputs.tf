# Order

  output "jdbc_pgsql_uri_order" {
    value = module.pgsql_flex_server_order.jdbc_pgsql_uri_order
    sensitive = true
  }

  output "pgsql_fqdn_order" {
    value = module.pgsql_flex_server_order.pgsql_fqdn_order
  }

  output "pgsql_database_name_order" {
    value = module.pgsql_flex_server_order.pgsql_database_name_order
    sensitive = true
  }

  output "pgsql_admin_username_order" {
    value = module.pgsql_flex_server_order.pgsql_admin_username_order
    sensitive = true
  }

  output "pgsql_admin_password_order" {
    value = module.pgsql_flex_server_order.pgsql_admin_password_order
    sensitive = true
  }

# Catalog

  output "jdbc_pgsql_uri_catalog" {
    value = module.pgsql_flex_server_catalog.jdbc_pgsql_uri_catalog
    sensitive = true
  }

  output "pgsql_fqdn_catalog" {
    value = module.pgsql_flex_server_catalog.pgsql_fqdn_catalog
  }

  output "pgsql_database_name_catalog" {
    value = module.pgsql_flex_server_catalog.pgsql_database_name_catalog
    sensitive = true
  }

  output "pgsql_admin_username_catalog" {
    value = module.pgsql_flex_server_catalog.pgsql_admin_username_catalog
    sensitive = true
  }

  output "pgsql_admin_password_catalog" {
    value = module.pgsql_flex_server_catalog.pgsql_admin_password_catalog
    sensitive = true
  }

# Payment

  output "azcosmosdb_endpoint_payment" {
    value = module.cosmosdb_payment.azcosmosdb_endpoint_payment
  }

  output "azcosmosdb_database_payment" {
    value = module.cosmosdb_payment.azcosmosdb_database_payment
  }

  output "azcosmosdb_key_payment" {
    value     = module.cosmosdb_payment.azcosmosdb_key_payment
    sensitive = true
  }