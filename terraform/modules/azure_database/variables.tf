# Common
  variable "dns_prefix" {
    type = string
    description = "Prefixo DNS para a conta de armazenamento. Deve ser único globalmente."
    
    validation {
      condition     = length(var.dns_prefix) >= 1 && length(var.dns_prefix) <= 54
      error_message = "O 'dns_prefix' deve ter entre 1 e 54 caracteres."
    }
  }
  variable "resource_group_name" {
    type = string
    description = "Nome do resource group"
    
    validation {
      condition = can(regex("^[a-zA-Z0-9]+$", var.resource_group_name))
      error_message = "O nome do resource group deve conter apenas letras e números."
    }
  }
  variable "location" {
    description = "Localização do recurso"
    type = string
  }

# Azure Database

  variable "db_charset" {
    type        = string
    description = "Charset do banco de dados"
  }

  variable "db_collation" {
    type        = string
    description = "Collation do banco de dados"
  }

  variable "db_version" {
    type        = string
    description = "Versão do banco de dados"
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
  }

  variable "db_sku_name" {
    type        = string
    description = "SKU do banco de dados"
  }
