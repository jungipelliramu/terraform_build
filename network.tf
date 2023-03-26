resource "azurerm_network_security_group" "nsg1" {

  name                = "nsg1"
  location            = var.location
  resource_group_name = azurerm_resource_group.RG1.name
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "DEVVNET1"
  location            = var.location
  resource_group_name = azurerm_resource_group.RG1.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  #   subnet {
  #     name = "subnet1"
  #     address_prefix = "10.0.1.0/24"
  #   }

  #   subnet {
  #     name = "subnet2"
  #     address_prefix = "10.0.2.0/24"
  #     security_group = azurerm_network_security_group.nsg1.id
  #   }

  tags = {
    environment = "Development"
    CreatedBy   = "SK"
    CreatedFrom = "Terraform"

  }
}

resource "azurerm_subnet" "subnet1" {
  name                 = "DEVSUBNET1"
  resource_group_name  = azurerm_resource_group.RG1.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "DEVSUBNET2"
  resource_group_name  = azurerm_resource_group.RG1.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "subnet3" {
  name                 = "DEVSUBNET3"
  resource_group_name  = azurerm_resource_group.RG1.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.3.0/24"]
}

##################production vnet1###############################
resource "azurerm_virtual_network" "prodvnet1" {
  name                = "PRODVNET1"
  resource_group_name = azurerm_resource_group.RG1.name
  location            = var.location
  address_space       = ["10.1.0.0/16"]
  tags = {
    environment = "Production"
    CreatedBy   = "SK"
    CreatedFrom = "Terraform"

  }
}
resource "azurerm_subnet" "subnets" {
  count                = length(var.prodsubnets)
  name                 = "${var.prodprefix}SUBNET${count.index + 1}"
  resource_group_name  = azurerm_resource_group.RG1.name
  virtual_network_name = azurerm_virtual_network.prodvnet1.name
  address_prefixes     = [var.prodsubnets[count.index]]
}

#######################################################################
