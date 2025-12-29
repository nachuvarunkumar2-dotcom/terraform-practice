terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_mssql_server" "sqlserver" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
}

resource "azurerm_mssql_database" "sqldb" {
  name                = var.sql_db_name
  server_id           = azurerm_mssql_server.sqlserver.id
  sku_name            = "GP_S_Gen5_2"   # FREE tier serverless
  max_size_gb         = 32
  auto_pause_delay    = 60
  min_capacity        = 0.5
}

resource "azurerm_mssql_firewall_rule" "client_ip" {
  name             = "AllowMyIP"
  server_id        = azurerm_mssql_server.sqlserver.id
  start_ip_address = var.client_ip
  end_ip_address   = var.client_ip
}
