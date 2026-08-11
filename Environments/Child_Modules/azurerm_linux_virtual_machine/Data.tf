data "azurerm_network_interface" "network_interface" {
  for_each = var.linux_virtual_machines
  name = each.value.network_interface_card_name
  resource_group_name = each.value.resource_group_name
}