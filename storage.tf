resource "azurerm_storage_account" "sg1" {
  name = "storageaccount0501"
  resource_group_name = azurerm_resource_group.RG1.name
  location = var.location
  account_tier = "Standard"
  account_replication_type = "LRS"

  tags = {
    "Environment" = "Development"
    "CreatedBy" = "SK"
    "CreatedFrom" = "Terraform"
  }
}