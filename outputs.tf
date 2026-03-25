output "resource_group_names" {
  value = { for k, v in azurerm_resource_group.main : k => v.name }
}