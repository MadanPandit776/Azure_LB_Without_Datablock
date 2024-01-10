resource "azurerm_mssql_server" "example" {
    for_each = var.sqlserver
  name                         = each.value.name
  resource_group_name          = "Madan_RG"
  location                     = "east us"
  version                      = "12.0"
  administrator_login          = "MadanPandit"
  administrator_login_password = "Faridabad@1989"
  minimum_tls_version          = "1.2"
}