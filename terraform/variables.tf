# Commn
  variable "subscription_id" {
    type        = string
    description = "Azure Subscription ID"
    # Default (Via tfvars)
  }

# remote states
  variable "foodcore-backend-resource-group" {
    type        = string
    description = "Nome do resource group onde o backend está armazenado"
  }

  variable "foodcore-backend-storage-account" {
    type        = string
    description = "Nome da conta de armazenamento onde o backend está armazenado"
  }

  variable "foodcore-backend-container" {
    type        = string
    description = "Nome do contêiner onde o backend está armazenado"
  }

  variable "foodcore-backend-infra-key" {
    type        = string
    description = "Chave do arquivo tfstate do foodcore-infra"
  }

# Azure Database

  variable "db_charset" {
    type        = string
    description = "Charset do banco de dados"
    default     = "UTF8"
  }

  variable "db_collation" {
    type        = string
    description = "Collation do banco de dados"
    default     = "en_US.utf8"
  }

  variable "db_version" {
    type        = string
    description = "Versão do banco de dados"
    default     = "12"
  }

  variable "administrator_login" {
    type        = string
    description = "Login do administrador do banco de dados"
  }

  variable "administrator_password" {
    type        = string
    description = "Senha do administrador do banco de dados"
  }

  variable "db_storage_mb" {
    type        = number
    description = "Tamanho do armazenamento do banco de dados em MB"
    default     = 10000
  }

  variable "db_sku_name" {
    type        = string
    description = "SKU do banco de dados"
    default     = "B_Standard_B1ms"
  }