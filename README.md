# AzFW-TFPremiumMigrate

This repository contains Terraform Templates showing the step by step process for migrating from Azure Firewall Standard to Azure Firewall Premium.

The samples in this repository utilize the following resource types listed below from the AzureRM provider for Terraform,more information regarding syntax and usage can be found on the by following the links to the the Terraform Registry. 

[azurerm_firewall](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall)

[azurerm_firewall_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_policy)

[azurerm_firewall_application_rule_collection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_application_rule_collection)

[azurerm_firewall_network_rule_collection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_network_rule_collection)


The Microsoft Docs page for this topic - [Migrate Azure Firewall Standard to Premium using Terraform](https://docs.microsoft.com/en-us/azure/developer/terraform/firewall-upgrade-premium)

## 1. The Original Terraform Template 
## 2. Changing from Classic Rules to Premium Policy 
Now you have a standard firewall with classic rules. Next, create a premium Firewall Policy and import the rules from the firewall.

1. On the Azure portal, select **Create a resource**.
1. Search for **firewall policy** and select it.
1. Select **Create**.
1. For Resource group select **test-resources** .
1. For Name, type **prem-pol**.
1. For Region, select **East US**.
1. For Policy tier, select **Premium**.
1. Select **Next: DNS Settings**, and continue until you reach the Rules page.
1. On the Rules page, select **Import rules from an Azure Firewall**.
1. Select **testfirewall**, and then select **Import**.
1. Select **Review + create**.
1. Select **Create**.

## 3. Adding the data section to the Terraform Template

## 4. Updating the Azure Firewall Resource

## 5. Removing the old Classic Rule Collections
