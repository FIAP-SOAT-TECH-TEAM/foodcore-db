output "jdbc_pgsql_connection_string_foodcoreapi" {
  value = module.database.jdbc_pgsql_connection_string_foodcoreapi
  sensitive = true
}

output "pgsql_admin_username_foodcoreapi" {
  value = module.database.pgsql_admin_username_foodcoreapi
  sensitive = true
}

output "pgsql_admin_password_foodcoreapi" {
  value = module.database.pgsql_admin_password_foodcoreapi
  sensitive = true
}