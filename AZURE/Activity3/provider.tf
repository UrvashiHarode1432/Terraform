provider "azurerm" {
  features { 
  }
}

resource "azurerm_resource_group" "myresg" {
  name = "fromtf"
  location = "eastus"
}

resource "azurerm_storage_account" "first" {
  name = "madefromtf"
  resource_group_name = azurerm_resource_group.myresg.name
  location = azurerm_resource_group.myresg.location
  account_tier = "Standard"
  account_replication_type = "GRS"

  depends_on = [ azurerm_resource_group.myresg ]
}