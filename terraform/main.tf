module "database" {
  source                  = "./modules/azure_database"
  dns_prefix              = data.terraform_remote_state.infra.outputs.dns_prefix
  resource_group_name     = data.terraform_remote_state.infra.outputs.resource_group_name
  location                = data.terraform_remote_state.infra.outputs.location
  vnet_aks_subnet_prefix  = data.terraform_remote_state.infra.outputs.vnet_aks_subnet_prefix
  db_subnet_id            = data.terraform_remote_state.infra.outputs.db_subnet_id
  private_dns_zone_id     = data.terraform_remote_state.infra.outputs.pgsql_private_dns_zone_id
  db_charset              = var.db_charset
  db_collation            = var.db_collation
  db_version              = var.db_version
  administrator_login     = var.administrator_login
  administrator_password  = var.administrator_password
  db_storage_mb           = var.db_storage_mb
  db_sku_name             = var.db_sku_name
}