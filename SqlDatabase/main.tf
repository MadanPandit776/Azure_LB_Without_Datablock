resource "azurerm_mssql_database" "example" {
    for_each = var.mssqldatabase
  name           = each.value.name
  server_id      = each.value.server_id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  #max_size_gb    = 4
  #read_scale     = true
  #sku_name       = "S0"
  #zone_redundant = true
  #enclave_type   = "VBS"
}