output "jdbc_pgsql_connection_string_foodcoreapi" {
  value = "jdbc:postgresql://${azurerm_postgresql_flexible_server.psqlflexibleserver.fqdn}:5432/${azurerm_postgresql_flexible_server_database.foodcore_pgsql_database.name}?user=${var.administrator_login}&password=${var.administrator_password}"
  sensitive = true
}

output "pgsql_fqdn" {
  value = azurerm_postgresql_flexible_server.psqlflexibleserver.fqdn
}

output "pgsql_admin_username_foodcoreapi" {
  value = var.administrator_login
  sensitive = true
}

output "pgsql_admin_password_foodcoreapi" {
  value = var.administrator_password
  sensitive = true
}