# resource "azurerm_lb" "lb" {
#   name                = "az_lb"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name

#   frontend_ip_configuration {
#     name                 = "public2"
#     public_ip_address_id = azurerm_public_ip.ip2.id
#   }
# }

# resource "azurerm_lb_backend_address_pool" "bpepool" {
#   resource_group_name = azurerm_resource_group.rg.name
#   loadbalancer_id     = azurerm_lb.lb.id
#   name                = "BackEndAddressPool"
# }