output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}
output "vnet_cidr" {
  value = azurerm_virtual_network.vnet.address_space
}

output "public_subnet_id" {
  value = azurerm_virtual_network.vnet.subnet.*.id
}

output "private_app_subnet_id" {
  value = azurerm_virtual_network.vnet.subnet.*.id[1]
}
output "private_dbs_subnet_id" {
  value = azurerm_virtual_network.vnet.subnet.*.id[2]
}
output "private_ads_subnet_id" {
  value = azurerm_virtual_network.vnet.subnet.*.id[3]
}