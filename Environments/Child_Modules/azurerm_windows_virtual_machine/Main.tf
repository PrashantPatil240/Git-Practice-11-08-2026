resource "azurerm_windows_virtual_machine" "windows_virtual_machine" {
  for_each              = var.windows_virtual_machines
  name                  = each.value.name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  size                  = each.value.size
  admin_username        = each.value.admin_username
  admin_password        = each.value.admin_password
  network_interface_ids = [data.azurerm_network_interface.network_interface[each.key].id]

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}