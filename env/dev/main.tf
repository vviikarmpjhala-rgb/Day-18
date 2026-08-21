module "resource_group" {
  source  = "../../modules/azurerm_resource_group"
  sdn_rgs = var.sdn_rgs
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_virtual_network"
  sdn_vnets  = var.sdn_vnets
}

module "subnets" {
  depends_on  = [module.virtual_network]
  source      = "../../modules/azurerm_subnet"
  sdn_subnets = var.sdn_subnets

}

module "sdn_pips" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_public_ip"
  sdn_pips   = var.sdn_pips

}

module "sdn_nsgs" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_network_security_group"
  sdn_nsgs   = var.sdn_nsgs
}

module "sdn_vm_nics" {
  depends_on  = [module.subnets, module.sdn_pips]
  source      = "../../modules/azurerm_linux_virtual_machine"
  sdn_vm_nics = var.sdn_vm_nics
}