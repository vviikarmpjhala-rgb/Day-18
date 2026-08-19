resource "azurerm_resource_group" "sdn_rgs" {
  for_each = var.sdn_rgs
  name     = each.value.name
  location = each.value.location
}