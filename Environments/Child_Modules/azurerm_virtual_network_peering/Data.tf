data "azurerm_virtual_network" "virtual_network" {
  for_each            = var.virtual_network_peerings
  name                = each.value.remote_virtual_network_name
  resource_group_name = each.value.remote_resource_group_name
}