output "jdbc_pgsql_uri_order" {
  value = "jdbc:postgresql://${azurerm_postgresql_flexible_server.psqlflexibleserver_order.fqdn}:5432/${azurerm_postgresql_flexible_server_database.foodcore_pgsql_database_order.name}?user=${var.pgsql_flex_administrator_login}&password=${var.pgsql_flex_administrator_password}"
  sensitive = true
}

output "pgsql_fqdn_order" {
  value = azurerm_postgresql_flexible_server.psqlflexibleserver_order.fqdn
}

output "pgsql_database_name_order" {
  value = azurerm_postgresql_flexible_server_database.foodcore_pgsql_database_order.name
  sensitive = true
}

output "pgsql_admin_username_order" {
  value = var.pgsql_flex_administrator_login
  sensitive = true
}

output "pgsql_admin_password_order" {
  value = var.pgsql_flex_administrator_password
  sensitive = true
}