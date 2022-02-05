terraform {

  required_version = ">=0.12"
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_firewall_policy" "prem-pol" {
  name                 = "prem-pol"
  resource_group_name  = azurerm_resource_group.rg.name
}

resource "azurerm_resource_group" "rg" {
  name     = "test-resources"
  location = var.resource_group_location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "testvnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "pip" {
  name                = "testpip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "fw" {
     name                = "testfirewall"
     location            = azurerm_resource_group.rg.location
     resource_group_name = azurerm_resource_group.rg.name
     firewall_policy_id  = data.azurerm_firewall_policy.prem-pol.id
     sku_tier            = "Premium"

 ip_configuration {
     name                 = "configuration"
     subnet_id            = azurerm_subnet.subnet.id
     public_ip_address_id = azurerm_public_ip.pip.id
 }
}