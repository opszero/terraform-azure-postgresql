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

  server_name            = "test-pg-primary"
  administrator_login    = "psql"
  administrator_password = random_password.password.result
}

resource "time_sleep" "sleep" {
  create_duration = "1m"

  depends_on = [module.postgresql]
}

module "postgresql_replica" {
  source = "../../"

  resource_group_name = ""
  location            = ""

  server_name            = "test-pg-replica"
  administrator_login    = "psql"
  administrator_password = random_password.password.result

  create_mode               = "Replica"
  creation_source_server_id = module.postgresql.server_id

  depends_on = [time_sleep.sleep]
}