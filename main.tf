terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.20.0"
    }
  }
  backend "local" {}
}

provider "azurerm" {
  features {
       key_vault {
      purge_soft_delete_on_destroy = true
    }
  }

  # Configuration options
  # client_id       = ${var.client_id}
  # client_secret   = var.client_secret
  # subscription_id = var.subscription_id
  # tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

