#VNet
resource "azurerm_virtual_network" "vnet" {
  name                = "virtual-network"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}

#Subnet
resource "azurerm_subnet" "subnet1" {
  name                = "subnet1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_prefix      = "10.0.1.0/24"
}
resource "azurerm_subnet" "subnet2" {
  name                = "subnet2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_prefix      = "10.0.2.0/24"
}

resource "azurerm_subnet" "subnet3" {
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  name                = "subnet3"
  address_prefix      = "10.0.3.0/24"
}