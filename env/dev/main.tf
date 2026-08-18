module "resource_group" {
    source ="../../modules/azurerm_resource_group"
    sdn_rgs = var.sdn_rgs
}