resource "azurerm_log_analytics_workspace" "acctest01" {
  name                = "acctest01"
  location            = var.location
  resource_group_name = azurerm_resource_group.RG1.name
  sku                 = "PerGB2018"
  retention_in_days   = 30

}
