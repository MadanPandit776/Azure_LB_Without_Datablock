resource "azurerm_public_ip" "example" {
    for_each = var.PIP
  name                = each.value.name
  resource_group_name = "Madan_RG"
  location            = "east us"
  allocation_method   = "Static"
  sku                 = "Standard"
}