resource "azurerm_virtual_network" "vnet" {
    name                = var.vnet_name
    address_space       = var.vnet_cidr
    location            = var.location
    resource_group_name = var.rg_name
    dns_servers         = var.dns_servers

    # Public Subnet
    subnet {
        name  =  "public_subnet"
        address_prefix = var.public_subnet
    }

    # App Subnet
    subnet {
        name  = "private_app_subnet"
        address_prefix = var.private_app_subnet
        #security_group = azurerm_network_security_group.dbs_sec_group.id
    }

    # DB Subnet
    subnet {
        name  = "private_db_subnet"
        address_prefix = var.private_db_subnet
        #security_group = azurerm_network_security_group.dbs_sec_group.id
    }

    # ADS Subnet
    subnet {
        name  = "private_ads_subnet"
        address_prefix = var.private_ads_subnet
        #security_group = azurerm_network_security_group.ads_sec_group.id
    }
    tags = {
        env = var.env
    }
}
resource "azurerm_public_ip" "nat_gw_ip" {
    name                = "nat-gateway-public-ip"
    location            = var.location
    resource_group_name = var.rg_name
    allocation_method   = "Static"
    sku                 = "Standard"
    availability_zone   = "Zone-Redundant"
}
resource "azurerm_nat_gateway" "nat_gw" {
    name                    = "nat-gateway"
    location                = var.location
    resource_group_name     = var.rg_name
    sku_name                = "Standard"
    idle_timeout_in_minutes = 10
}
resource "azurerm_nat_gateway_public_ip_association" "natgw_publicip_association" {
  nat_gateway_id       = azurerm_nat_gateway.nat_gw.id
  public_ip_address_id = azurerm_public_ip.nat_gw_ip.id
}
resource "azurerm_subnet_nat_gateway_association" "app_subnet_association" {
    subnet_id      = azurerm_virtual_network.vnet.subnet.*.id[1]
    nat_gateway_id = azurerm_nat_gateway.nat_gw.id
}
resource "azurerm_subnet_nat_gateway_association" "dbs_subnet_association" {
    subnet_id      = azurerm_virtual_network.vnet.subnet.*.id[2]
    nat_gateway_id = azurerm_nat_gateway.nat_gw.id
}
resource "azurerm_subnet_nat_gateway_association" "ads_subnet_association" {
    subnet_id      = azurerm_virtual_network.vnet.subnet.*.id[3]
    nat_gateway_id = azurerm_nat_gateway.nat_gw.id
}