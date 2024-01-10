resource "azurerm_virtual_machine" "main" {
    for_each = var.MyVM
  name                  = each.value.name
  location              = "east us"
  resource_group_name   = "Madan_RG"
  network_interface_ids = each.value.network_interface_ids
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = each.value.diskname
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = each.value.computer_name
    admin_username = "madan"
    admin_password = "Faridabad@1989"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}