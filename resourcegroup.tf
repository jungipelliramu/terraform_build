resource "azurerm_resource_group" "RG1" {
  #   count    = length(var.locations)
  name     = "RG1"
  location = var.location
  tags = {
    "Created From" = "Terraform"
    "Created By"   = "SK"
  }
}
