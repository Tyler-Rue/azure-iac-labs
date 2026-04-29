terraform {
  required_version = ">= 1.5.0"

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

variable "environment" {
  description = "Deployment environment name"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Environment must be one of: dev, test, prod."
  }
}

variable "location" {
  description = "Azure region for deployed resources"
  type        = string
  default     = "eastus"
}

locals {
  storage_sku    = var.environment == "prod" ? "Standard_GRS" : "Standard_LRS"
  storage_prefix = "tr${var.environment}"
  common_tags = {
    environment = var.environment
    project     = "azure-iac-labs"
    managedBy   = "terraform"
  }
}

resource "azurerm_resource_group" "lab" {
  name     = "rg-terraform-env-${var.environment}"
  location = var.location

  tags = local.common_tags
}

resource "azurerm_storage_account" "lab" {
  name                     = lower("${local.storage_prefix}${substr(md5(azurerm_resource_group.lab.id), 0, 10)}")
  resource_group_name      = azurerm_resource_group.lab.name
  location                 = azurerm_resource_group.lab.location
  account_tier             = "Standard"
  account_replication_type = var.environment == "prod" ? "GRS" : "LRS"

  tags = local.common_tags
}

output "environment_name" {
  value = var.environment
}

output "resource_group_name" {
  value = azurerm_resource_group.lab.name
}

output "storage_account_name" {
  value = azurerm_storage_account.lab.name
}

output "storage_replication_type" {
  value = azurerm_storage_account.lab.account_replication_type
}
