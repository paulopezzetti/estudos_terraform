resource "azurerm_resource_group" "vnet_terraform" {
  name     = "vnet"
  location = var.location

  tags = local.common_tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.vnet_terraform.name
  address_space       = ["10.0.0.0/16"]

  tags = local.common_tags
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet"
  resource_group_name  = azurerm_resource_group.vnet_terraform.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes       = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "sg" {
  name                = "sg"
  location            = var.location
  resource_group_name = azurerm_resource_group.vnet_terraform.name

  security_rule {
    name                       = "allow_ssh"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    priority                   = 100
    access                     = "Allow"
    direction                  = "Inbound"

  }

  tags = local.common_tags
}

resource "azurerm_subnet_network_security_group_association" "association" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.sg.id
}
  