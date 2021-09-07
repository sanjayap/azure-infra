terraform {
    backend "azurerm" {
        resource_group_name  = "dev-rg"
        storage_account_name = "devazuresa"
        container_name       = "tfstate"
        key                  = "dev.terraform.tfstate"
    }
    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = "=2.72.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

module "dev_vnet" {
    source                  = "../modules/azure_network"
    env                     = var.env
    vnet_name               = var.vnet_name
    location                = var.location
    rg_name                 = var.rg_name         
    vnet_cidr               = var.vnet_cidr
    public_subnet           = var.public_subnet
    private_app_subnet      = var.private_app_subnet
    private_db_subnet       = var.private_db_subnet
    private_ads_subnet      = var.private_ads_subnet
    dns_servers             = var.dns_servers
}