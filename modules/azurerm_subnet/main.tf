resource "azurerm_subnet" "sdn_subnets" {
  for_each             = var.sdn_subnets
  name                 = each.value.name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
  address_prefixes     = each.value.address_prefixes
}