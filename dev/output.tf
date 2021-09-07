output "vnet_id" {
  value = module.dev_vnet.vnet_id
}
output "vnet_cidr" {
  value = module.dev_vnet.vnet_cidr
}

output "public_subnet_id" {
  value = module.dev_vnet.public_subnet_id
}

output "private_app_subnet_id" {
  value = module.dev_vnet.private_app_subnet_id
}
output "private_dbs_subnet_id" {
  value = module.dev_vnet.private_dbs_subnet_id
}
output "private_ads_subnet_id" {
  value = module.dev_vnet.private_ads_subnet_id
}