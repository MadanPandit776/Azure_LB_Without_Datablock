resource "azurerm_subnet_network_security_group_association" "example" {
    for_each = var.NsgAssociation
  subnet_id                 = each.value.subnet_id
  network_security_group_id = each.value.network_security_group_id
   #backend_address_pool_id     = "/subscriptions/bf616c2a-03fb-4ee3-b117-12a41f4f3a31/resourceGroups/Madan_RG/providers/Microsoft.Network/loadBalancers/MyLB/backendAddressPools/BackEndAddressPool"
  # loadbalancer_backend_port   = 80
  # loadbalancer_name           = azurerm_lb.example.name
  }