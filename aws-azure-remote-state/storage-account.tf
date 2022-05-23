resource "azurerm_resource_group" "resource_group_terraform" {
  name     = "remote-state"
  location = var.location

  tags = local.common_tags
}

resource "azurerm_storage_account" "storage_account_terraform" {
  name                     = "remotestatepezzetti"
  resource_group_name      = azurerm_resource_group.resource_group_terraform.name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  blob_properties {
    versioning_enabled = true
  }

  tags = local.common_tags
}

resource "azurerm_storage_container" "container_terraform" {
  name                 = "remote-state"
  storage_account_name = azurerm_storage_account.storage_account_terraform.name

}