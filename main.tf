terraform {
  required_providers {
    azurerm={
        source = "hashicorp/azurerm"
        version=">=3.7.0"
    }
  }

  backend "azurerm" {
    resource_group_name = "rg-terraform-github-actions-state"
    storage_account_name = "tfghactions2305"
    container_name = "tfstate"
    key = "terraform.tfstate"
    use_oidc=true
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

resource "azurerm_resource_group" "rg-aks" {
  name = var.resource_group_name
  location= var.location
}