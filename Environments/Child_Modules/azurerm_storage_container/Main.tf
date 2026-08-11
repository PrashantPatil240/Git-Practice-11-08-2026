resource "azurerm_storage_container" "storage_container" {
  for_each = var.storage_containers
  name = each.value.name
  storage_account_id = data.azurerm_storage_account.storage_account[each.key].id
  container_access_type = each.value.container_access_type
}