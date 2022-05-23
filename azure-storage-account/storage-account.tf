resource "azurerm_resource_group" "resource_group_terraform" {
  name     = "storage_account_resource_group"
  location = var.location

  tags = local.common_tags
}

resource "azurerm_storage_account" "storage_account_terraform" {
  name                     = "storageaccount666666"
  resource_group_name      = azurerm_resource_group.resource_group_terraform.name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = local.common_tags
}

resource "azurerm_storage_container" "container_terraform" {
  name                  = "terraform"
  storage_account_name  = azurerm_storage_account.storage_account_terraform.name
}