resource "azurerm_virual_network" "sdn_vnets" {
  for_each            = var.sdn_vnets
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space

}