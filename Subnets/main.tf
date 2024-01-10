resource "azurerm_subnet" "example" {
    for_each = var.mysubnet
  name                 = each.value.name
  resource_group_name  = "Madan_RG"
  virtual_network_name = "Virtual_Network"
  address_prefixes     = each.value.address_prefixes
}