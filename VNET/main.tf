resource "azurerm_virtual_network" "example" {
    for_each = var.VNET
  name                = each.value.name
  location            = "East us"
  resource_group_name = "Madan_RG"
  address_space       = ["10.0.0.0/16"]

}