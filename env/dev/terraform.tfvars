sdn_rgs = {
  sdn_rg1 = {
    name     = "sdn_rg1"
    location = "centralindia"
  }
  sdn_rg2 = {
    name     = "sdn_rg2"
    location = "centralindia"
  }
}

sdn_vnets = {
  sdn_vnet1 = {
    name                = "infra_vnet1"
    location            = "centralindia"
    resource_group_name = "sdn_rg1"
    address_space       = ["10.0.0.0/16"]
  }
}