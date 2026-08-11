module "Resource_Groups" {
  source          = "../../Child_Modules/azurerm_resource_group"
  resource_groups = var.Resource_Group
}

module "Virtual_Networks" {
  source           = "../../Child_Modules/azurerm_virtual_network"
  virtual_networks = var.Virtual_Network
  depends_on       = [module.Resource_Groups]
}

module "Subnets" {
  source     = "../../Child_Modules/azurerm_subnet"
  subnets    = var.Subnet
  depends_on = [module.Virtual_Networks]
}

module "Public_IPs" {
  source     = "../../Child_Modules/azurerm_public_ip"
  public_ips = var.Public_IP
  depends_on = [module.Resource_Groups]
}

module "Network_Interface_Cards" {
  source                  = "../../Child_Modules/azurerm_network_interface"
  network_interface_cards = var.Network_Interface_Card
  depends_on              = [module.Subnets, module.Public_IPs]
}

module "Network_Security_Groups" {
  source                  = "../../Child_Modules/azurerm_network_security_group"
  network_security_groups = var.Network_Security_Group
  depends_on              = [module.Resource_Groups]
}

module "Storage_Accounts" {
  source           = "../../Child_Modules/azurerm_storage_account"
  storage_accounts = var.Storage_Account
  depends_on       = [module.Resource_Groups]
}

module "Storage_Containers" {
  source             = "../../Child_Modules/azurerm_storage_container"
  storage_containers = var.Storage_Container
  depends_on         = [module.Storage_Accounts]
}

module "Virtual_Network_Peerings" {
  source                   = "../../Child_Modules/azurerm_virtual_network_peering"
  virtual_network_peerings = var.Virtual_Network_Peering
  depends_on               = [module.Virtual_Networks]
}

module "Bastion_Hosts" {
  source        = "../../Child_Modules/azurerm_bastion_host"
  bastion_hosts = var.Bastion_Host
  depends_on    = [module.Public_IPs, module.Subnets]
}

module "Linux_Virtual_Machine" {
  source                 = "../../Child_Modules/azurerm_linux_virtual_machine"
  linux_virtual_machines = var.Linux_Virtual_Machine
  depends_on             = [module.Network_Interface_Cards]
}

module "Windows_Virtual_Machine" {
  source                   = "../../Child_Modules/azurerm_windows_virtual_machine"
  windows_virtual_machines = var.Windows_Virtual_Machine
  depends_on               = [module.Network_Interface_Cards]
}