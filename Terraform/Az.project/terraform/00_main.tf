# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.20"
    }
  }
}

data "azurerm_client_config" "current" {}
