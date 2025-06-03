provider "azurerm" {
  features {}
}

resource "random_password" "password" {
  length      = 20
  min_lower   = 1
  min_numeric = 1
  min_special = 1
  min_upper   = 1
}

module "postgresql" {
  source = "../../"

  resource_group_name = ""
  location            = ""

  server_name            = "test-server-postgresql"
  administrator_login    = "psql"
  administrator_password = random_password.password.result
}