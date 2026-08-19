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

sdn_subnets = {
  sdn_subnet1 = {
    name                 = "frontend"
    virtual_network_name = "infra_vnet1"
    resource_group_name  = "sdn_rg1"
    address_prefixes     = ["10.0.1.0/24"]
  }
}