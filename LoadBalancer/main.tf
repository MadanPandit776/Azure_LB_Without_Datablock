resource "azurerm_lb" "lb" {
  name                = "MyLB"
  location            = "east us"
  resource_group_name = "Madan_RG"
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = "/subscriptions/bf616c2a-03fb-4ee3-b117-12a41f4f3a31/resourceGroups/Madan_RG/providers/Microsoft.Network/publicIPAddresses/PublicIP-2"
  }
}

resource "azurerm_lb_backend_address_pool" "lb_backup_pool" {
    
  #loadbalancer_id = "/subscriptions/bf616c2a-03fb-4ee3-b117-12a41f4f3a31/resourceGroups/Madan_RG/providers/Microsoft.Network/loadBalancers/MyLB"
  loadbalancer_id = azurerm_lb.lb.id
  name            = "BackEndAddressPool"
}


resource "azurerm_network_interface_backend_address_pool_association" "InfBackAddPool" {
 for_each = var.InfBackAddPool
  network_interface_id    = each.value.network_interface_id
  ip_configuration_name   = each.value.ip_configuration_name
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backup_pool.id
}

resource "azurerm_lb_probe" "lb_probe" {
  #loadbalancer_id = "/subscriptions/bf616c2a-03fb-4ee3-b117-12a41f4f3a31/resourceGroups/Madan_RG/providers/Microsoft.Network/loadBalancers/MyLB"
  loadbalancer_id = azurerm_lb.lb.id
  name            = "lb_prob"
  port            = "22"
}

resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "MyLbRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.lb_backup_pool.id]
  probe_id = azurerm_lb_probe.lb_probe.id

}