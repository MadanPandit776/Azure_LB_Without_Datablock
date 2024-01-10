resource "azurerm_network_security_group" "example" {
    for_each = var.nsg
  name                = each.value.name
  location            = "east us"
  resource_group_name = "Madan_RG"

  security_rule {
    name                       = each.value.Sec_Rule
    priority                   = each.value.priority
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}