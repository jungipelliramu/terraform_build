resource "azurerm_application_security_group" "webservers01" {
  name = "webservers01"
  location = var.location
  resource_group_name = azurerm_resource_group.RG1.name
}

resource "azurerm_application_security_group" "dbservers01" {
  name = "dbservers01"
  location = var.location
  resource_group_name = azurerm_resource_group.RG1.name
}