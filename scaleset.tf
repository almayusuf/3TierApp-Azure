resource "azurerm_linux_virtual_machine_scale_set" "linuxss" {
  name                 = "linuxvmss"
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  sku                  = "Standard_F2"
  instances            = 1
  admin_username       = "adminuser"
  computer_name_prefix = "linuxssvm"
  user_data            = filebase64("/home/ec2-user/3TierApp-Azure/wordpress.sh")

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "nic2"
    primary = true

    ip_configuration {
      name      = "public1"
      primary   = true
      subnet_id = azurerm_subnet.subnet1.id
    }
  }
}