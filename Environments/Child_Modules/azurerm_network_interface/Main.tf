resource "azurerm_network_interface" "network_interface" {
  for_each            = var.network_interface_cards
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_configuration_name
    private_ip_address_allocation = each.value.private_ip_address_allocation
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    # public_ip_address_id = each.value.public_ip_address_id
  }
}