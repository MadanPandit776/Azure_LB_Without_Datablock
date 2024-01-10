resource "azurerm_mssql_firewall_rule" "example" {
    for_each = var.firewall
  name             = each.value.name
  server_id        = "/subscriptions/bf616c2a-03fb-4ee3-b117-12a41f4f3a31/resourceGroups/Madan_RG/providers/Microsoft.Sql/servers/madansqlserver"
  start_ip_address = each.value.start_ip_address
  end_ip_address   = each.value.end_ip_address
}