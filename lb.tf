# # resource "azurerm_lb" "lb" {
# #   name                = "az_lb"
# #   location            = azurerm_resource_group.rg.location
# #   resource_group_name = azurerm_resource_group.rg.name

# #   frontend_ip_configuration {
# #     name                 = "public2"
# #     public_ip_address_id = azurerm_public_ip.ip2.id
# #   }
# # }

# # resource "azurerm_lb_backend_address_pool" "bpepool" {
# #   resource_group_name = azurerm_resource_group.rg.name
# #   loadbalancer_id     = azurerm_lb.lb.id
# #   name                = "BackEndAddressPool"
# # }


# resource "azurerm_lb_backend_address_pool" "bpepool" {
#  loadbalancer_id     = azurerm_lb.vmss.id
#  name                = "BackEndAddressPool"
# }

# resource "azurerm_lb_probe" "vmss" {
#  resource_group_name = azurerm_resource_group.vmss.name
#  loadbalancer_id     = azurerm_lb.vmss.id
#  name                = "ssh-running-probe"
#  port                = var.application_port
# }

# resource "azurerm_lb_rule" "lbnatrule" {
#    resource_group_name            = azurerm_resource_group.vmss.name
#    loadbalancer_id                = azurerm_lb.vmss.id
#    name                           = "http"
#    protocol                       = "Tcp"
#    frontend_port                  = var.application_port
#    backend_port                   = var.application_port
#    backend_address_pool_id        = azurerm_lb_backend_address_pool.bpepool.id
#    frontend_ip_configuration_name = "PublicIPAddress"
#    probe_id                       = azurerm_lb_probe.vmss.id
# }