terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

#provider "azurerm" {
#  features {}

  # Tell Terraform exactly which Azure subscription + tenant to use
  # subscription_id = "a25cecd1-bf85-4c40-a891-fafe0e83271d"
  # tenant_id       = "7508ef84-f789-4799-a1b1-3fa89645b91c"
# }

# Create Resource Group in Azure
resource "azurerm_resource_group" "example" {
  name     = "varun-tf-rg"
  location = "East US"
}
