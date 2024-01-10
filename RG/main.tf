resource "azurerm_resource_group" "example" {
    for_each = var.RG 
  name     = each.value.name
  location = each.value.location
}