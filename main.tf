terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.106.0"
    }
  }
  # Backends are responsible for storing state (state file):
  backend "azurerm" {
    resource_group_name  = "main-grp"
    storage_account_name = "appstororageacc"
    container_name       = "gh-tf-container"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  storage_use_azuread = true
  features {
  }
}

resource "azurerm_resource_group" "appgrp" {
  name     = local.resource_group_name
  location = local.location  
}
