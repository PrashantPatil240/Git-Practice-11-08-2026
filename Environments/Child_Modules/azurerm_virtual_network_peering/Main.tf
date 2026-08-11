resource "azurerm_virtual_network_peering" "virtual_network_peering" {
  for_each                  = var.virtual_network_peerings
  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  virtual_network_name      = each.value.virtual_network_name
  remote_virtual_network_id = data.azurerm_virtual_network.virtual_network[each.key].id
}