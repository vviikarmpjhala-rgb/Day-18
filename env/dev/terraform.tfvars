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
sdn_pips = {
  sdn_pip1 = {
    name                = "frontend_vm1_pip1"
    resource_group_name = "sdn_rg1"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  sdn_pip2 = {
    name                = "frontend_vm2_pip2"
    resource_group_name = "sdn_rg1"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}
sdn_nsgs = {
  sdn_nsg1 = {
    name                = "frontend_vm1_nsg"
    location            = "centralindia"
    resource_group_name = "sdn_rg1"
  }
  sdn_nsg2 = {
    name                = "Backend_vm1_nsg"
    location            = "centralindia"
    resource_group_name = "sdn_rg1"
  }
}
sdn_vm_nics = {
  sdn_vm_nic1 = {
    data_subnet_name     = "frontend"
    virtual_network_name = "infra_vnet1"
    rg_name              = "sdn_rg1"
    pip_name             = "frontend_vm1_pip1"
    nic_name             = "frontend_vm1_nic"
    location             = "centralindia"
    vm_name              = "frontend_vm1"
    computer_name       = "frontend-vm1"
    vm_size              = "Standard_B2s"
    admin_username       = "devopsadmin"
    admin_password       = "P@ssw0rd!"

  }
  sdn_vm_nic2 = {
    data_subnet_name     = "frontend"
    virtual_network_name = "infra_vnet1"
    rg_name              = "sdn_rg1"
    pip_name             = "frontend_vm2_pip2"
    nic_name             = "frontend_vm2_nic"
    location             = "centralindia"
    vm_name              = "frontend_vm2"
    computer_name       = "frontend-vm2"
    vm_size              = "Standard_B2s"
    admin_username       = "devopsadmin"
    admin_password       = "P@ssw0rd!"
  }
}