variable "env" {
  type    = string
  default = "dev"
}
variable "location" {
  type    = string
  default = "australiaeast"
}
variable "rg_name" {
  type    = string
  default = "dev_rg"
}
variable "vnet_name" {
  type    = string
  default = "dev_vnet"
}
variable "vnet_cidr" {
  type    = list(string)
  default = ["10.1.0.0/16"]
}
variable "dns_servers" {
  type    = list(string)
  default = ["10.1.48.10","10.1.49.10"]
}
variable "public_subnet" {
  default = "10.1.0.0/23"
}
variable "private_app_subnet" {
  default = "10.1.16.0/23"
}
variable "private_db_subnet" {
  default = "10.1.32.0/23"
}
variable "private_ads_subnet" {
  default = "10.1.48.0/23"
}