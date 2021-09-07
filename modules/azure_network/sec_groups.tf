resource "azurerm_network_security_group" "dbs_sec_group" {
    name                = "dbs_sec_gruop"
    location            = var.location
    resource_group_name = var.rg_name
    security_rule {
        name                       = "mssql_rule"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "1433"
        source_address_prefix      = var.vnet_cidr[0]
        destination_address_prefix = "*"
    }
}
resource "azurerm_network_security_group" "app_sec_group" {
    name                = "app_sec_gruop"
    location            = var.location
    resource_group_name = var.rg_name
    security_rule {
        name                       = "http_rule"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = var.vnet_cidr[0]
        destination_address_prefix = "*"
    }
    security_rule {
        name                       = "https_rule"
        priority                   = 101
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = var.vnet_cidr[0]
        destination_address_prefix = "*"
    }
}
resource "azurerm_network_security_group" "ads_sec_group" {
    name                = "ads_sec_gruop"
    location            = var.location
    resource_group_name = var.rg_name
}