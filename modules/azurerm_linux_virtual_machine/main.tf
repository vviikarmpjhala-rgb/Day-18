data "azurerm_subnet" "sdn_data" {
  for_each = var.sdn_vm_nics
  name                 = each.value.data_subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "pip_data" {
  for_each = var.sdn_vm_nics
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}

resource "azurerm_network_interface" "sdn_nics" {
  for_each = var.sdn_vm_nics
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     =  data.azurerm_subnet.sdn_data[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.pip_data[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "sdn_linux_vm" {
  for_each = var.sdn_vm_nics
  name                = each.value.vm_name
  computer_name       = each.value.computer_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  size                = each.value.vm_size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password
  network_interface_ids = [
    azurerm_network_interface.sdn_nics[each.key].id,
  ]
  disable_password_authentication = false



  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}