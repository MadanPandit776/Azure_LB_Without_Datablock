resource "azurerm_network_interface" "example" {
    for_each = var.InterfacePrivate
  name                = each.value.name
  location            = "east us"
  resource_group_name = "Madan_RG"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}