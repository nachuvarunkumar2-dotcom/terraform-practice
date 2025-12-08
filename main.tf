terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  # By default this will use your Azure CLI login (az login).
  # subscription_id = "a25cecd1-bf85-4c40-a891-fafe0e83271d"
  #  tenant_id       = "7508ef84-f789-4799-a1b1-3fa89645b91c"
}

variable "rg_name" {
  type        = string
  description = "Name of the resource group to create"
  default     = "varun-tf-rg"
}

variable "location" {
  type        = string
  description = "Azure location for resources"
  default     = "eastus"
}

resource "azurerm_resource_group" "example" {
  name     = var.rg_name
  location = var.location
}

output "resource_group_name" {
  value = azurerm_resource_group.example.name
}
