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