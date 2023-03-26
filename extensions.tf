# data "azurerm_virtual_machine" "VMs" {
    
# }
# data "azurerm_resource_group" "rgs" {

# }

# resource "azurerm_virtual_machine_extension" "oms_mma" {
#   name                       = "OMSExtension"
#   location                   = "East Asia"
#   resource_group_name        = "RG1"
  # virtual_machine_id         = azurerm_virtual_machine.prodvm1.id
#   virtual_machine_name       = azurerm_virtual_machine.prodvm1.name
  # publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
  # type                       = "OmsAgentForLinux"
  # type_handler_version       = "1.6"
  # auto_upgrade_minor_version = "true"
#   workspaceId                = "d9774d67-5f81-4ea4-9285-8c297d364385"
#   workspacekey               = "akN/CsXO2NG0G8OGvs5hw+y2WAqCxjZwf7gPlAqp2E3KcMsCojQmlP/OxbG274Meq845DftCQHWZ4O26Wki8pw=="

  #  settings = <<-BASE_SETTINGS
  #  {
  #    "workspaceId" : var.workspace
  #  }
  #  BASE_SETTINGS

  #  protected_settings = <<-PROTECTED_SETTINGS
  #  {
  #    "workspaceKey" : "mykey"
  #  }
  #  PROTECTED_SETTINGS
# }
