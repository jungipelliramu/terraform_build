resource "azurerm_public_ip" "publicip1" {
  name                = "publicip1"
  resource_group_name = azurerm_resource_group.RG1.name
  location            = var.location
  allocation_method   = "Static"

  tags = {
    environment = "Development"
  }
}


resource "azurerm_network_interface" "int1" {
  name = "${var.prodprefix}-int1"
  location = var.location
  resource_group_name = azurerm_resource_group.RG1.name

  ip_configuration {
    name = "config1"
    subnet_id = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.publicip1.id
  }
}


resource "azurerm_virtual_machine" "devvm01" {
    name = "${var.devprefix}vm01-old"
    location = var.location
    resource_group_name = azurerm_resource_group.RG1.name
    network_interface_ids = [azurerm_network_interface.int1.id]
    delete_os_disk_on_termination = true
    delete_data_disks_on_termination = true
    vm_size = "Standard_DS1_V2"

    storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.devprefix}vm01-old"
    admin_username = "rootadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  
  tags = {
    environment = "Development"
    createdBy = "SK"
    createdFrom = "Terraform"
  }
}
###########VM's################

resource "azurerm_network_interface" "int2" {
  name = "${var.prodprefix}-int2"
  location = var.location
  resource_group_name = azurerm_resource_group.RG1.name

  ip_configuration {
    name = "config2"
    subnet_id = azurerm_subnet.subnets[2].id
    private_ip_address_allocation = "Dynamic"
    # public_ip_address_id = azurerm_public_ip.publicip1.id
  }
}

resource "azurerm_virtual_machine" "prodvm1" {
name = "${var.prodprefix}VM01"
resource_group_name = azurerm_resource_group.RG1.name
location = var.location
  network_interface_ids = [azurerm_network_interface.int2.id]
    delete_os_disk_on_termination = true
    delete_data_disks_on_termination = true
    vm_size = "Standard_DS1_V2"

    storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk2"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.prodprefix}vm01"
    admin_username = "rootadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  
  tags = {
    environment = "Production"
    createdBy = "SK"
    createdFrom = "Terraform"
  }
  
}