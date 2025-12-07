output "cosmosdb_subnet_id" {
  description = "O ID da subnet onde o Private Endpoint do Cosmos DB será criado."
  value       = azurerm_subnet.cosmosdb_subnet.id
}