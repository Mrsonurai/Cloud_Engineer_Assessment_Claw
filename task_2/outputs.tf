output "storage_account_name" {
  value = azurerm_storage_account.main.name
}

output "container_name" {
  value = azurerm_storage_container.main.name
}

output "vm_public_ip" {
  value = azurerm_public_ip.main.ip_address
}
