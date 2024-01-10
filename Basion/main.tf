resource "azurerm_bastion_host" "example" {
    for_each = var.BastionNode
  name                = each.value.name
  location            = "east us"
  resource_group_name = "Madan_RG"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = each.value.subnet_id
    public_ip_address_id = each.value.public_ip_address_id
  }
}