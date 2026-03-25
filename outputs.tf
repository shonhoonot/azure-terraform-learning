output "resource_group_id" {
  value = module.rg.id
}

output "storage_account_name" {
  value = azurerm_storage_account.main.name
}