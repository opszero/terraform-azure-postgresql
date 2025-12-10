<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4.55.0 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | The Administrator Login for the PostgreSQL Server. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_administrator_password"></a> [administrator\_password](#input\_administrator\_password) | The Password associated with the administrator\_login for the PostgreSQL Server. | `string` | n/a | yes |
| <a name="input_auto_grow_enabled"></a> [auto\_grow\_enabled](#input\_auto\_grow\_enabled) | (Optional) Enable or disable incremental automatic growth of database space. Storage auto-grow prevents your server from running out of storage and becoming read-only. If storage auto grow is enabled, the storage automatically grows without impacting the workload. The default value if not explicitly specified is `true`. | `bool` | `true` | no |
| <a name="input_backup_retention_days"></a> [backup\_retention\_days](#input\_backup\_retention\_days) | Backup retention days for the server, supported values are between 7 and 35 days. | `number` | `7` | no |
| <a name="input_create_mode"></a> [create\_mode](#input\_create\_mode) | (Optional) The creation mode. Can be used to restore or replicate existing servers. Possible values are `Default`, `Replica`, `GeoRestore`, and `PointInTimeRestore`. Defaults to `Default.` | `string` | `"Default"` | no |
| <a name="input_creation_source_server_id"></a> [creation\_source\_server\_id](#input\_creation\_source\_server\_id) | (Optional) For creation modes other than `Default`, the source server ID to use. | `string` | `null` | no |
| <a name="input_db_charset"></a> [db\_charset](#input\_db\_charset) | Specifies the Charset for the PostgreSQL Database, which needs to be a valid PostgreSQL Charset. Changing this forces a new resource to be created. | `string` | `"UTF8"` | no |
| <a name="input_db_collation"></a> [db\_collation](#input\_db\_collation) | Specifies the Collation for the PostgreSQL Database, which needs to be a valid PostgreSQL Collation. Note that Microsoft uses different notation - en-US instead of en\_US. Changing this forces a new resource to be created. | `string` | `"English_United States.1252"` | no |
| <a name="input_db_names"></a> [db\_names](#input\_db\_names) | The list of names of the PostgreSQL Database, which needs to be a valid PostgreSQL identifier. Changing this forces a new resource to be created. | `list(string)` | `[]` | no |
| <a name="input_firewall_rule_prefix"></a> [firewall\_rule\_prefix](#input\_firewall\_rule\_prefix) | Specifies prefix for firewall rule names. | `string` | `"firewall-"` | no |
| <a name="input_firewall_rules"></a> [firewall\_rules](#input\_firewall\_rules) | The list of maps, describing firewall rules. Valid map items: name, start\_ip, end\_ip. | `list(map(string))` | `[]` | no |
| <a name="input_geo_redundant_backup_enabled"></a> [geo\_redundant\_backup\_enabled](#input\_geo\_redundant\_backup\_enabled) | Enable Geo-redundant or not for server backup. Valid values for this property are Enabled or Disabled, not supported for the basic tier. | `bool` | `true` | no |
| <a name="input_infrastructure_encryption_enabled"></a> [infrastructure\_encryption\_enabled](#input\_infrastructure\_encryption\_enabled) | Whether or not infrastructure is encrypted for this server | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_postgresql_configurations"></a> [postgresql\_configurations](#input\_postgresql\_configurations) | A map with PostgreSQL configurations to enable. | `map(string)` | `{}` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether or not public network access is allowed for this server. Possible values are Enabled and Disabled. | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the PostgreSQL Server. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | Specifies the name of the PostgreSQL Server. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_server_version"></a> [server\_version](#input\_server\_version) | Specifies the version of PostgreSQL to use. Valid values are `9.5`, `9.6`, `10.0`, `10.2` and `11`. Changing this forces a new resource to be created. | `string` | `"9.5"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Specifies the SKU Name for this PostgreSQL Server. The name of the SKU, follows the tier + family + cores pattern (e.g. B\_Gen4\_1, GP\_Gen5\_8). | `string` | `"GP_Gen5_4"` | no |
| <a name="input_ssl_enforcement_enabled"></a> [ssl\_enforcement\_enabled](#input\_ssl\_enforcement\_enabled) | Specifies if SSL should be enforced on connections. Possible values are Enabled and Disabled. | `bool` | `true` | no |
| <a name="input_ssl_minimal_tls_version_enforced"></a> [ssl\_minimal\_tls\_version\_enforced](#input\_ssl\_minimal\_tls\_version\_enforced) | (Optional) The minimum TLS version to support on the sever. Possible values are `TLSEnforcementDisabled`, `TLS1_0`, `TLS1_1`, and `TLS1_2`. Defaults to `TLS1_2`. `ssl_minimal_tls_version_enforced` must be set to `TLSEnforcementDisabled` when `ssl_enforcement_enabled` is set to `false`. | `string` | `"TLS1_2"` | no |
| <a name="input_storage_mb"></a> [storage\_mb](#input\_storage\_mb) | Max storage allowed for a server. Possible values are between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU and between 5120 MB(5GB) and 4194304 MB(4TB) for General Purpose/Memory Optimized SKUs. | `number` | `102400` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to set on every taggable resources. Empty by default. | `map(string)` | `{}` | no |
| <a name="input_threat_detection_policy"></a> [threat\_detection\_policy](#input\_threat\_detection\_policy) | Threat detection policy configuration, known in the API as Server Security Alerts Policy | <pre>object(<br/>    {<br/>      enabled                    = optional(bool)<br/>      disabled_alerts            = optional(set(string))<br/>      email_account_admins       = optional(bool)<br/>      email_addresses            = optional(set(string))<br/>      retention_days             = optional(number)<br/>      storage_account_access_key = optional(string)<br/>      storage_endpoint           = optional(string)<br/>    }<br/>  )</pre> | `null` | no |
| <a name="input_tracing_tags_enabled"></a> [tracing\_tags\_enabled](#input\_tracing\_tags\_enabled) | Whether enable tracing tags that generated by BridgeCrew Yor. | `bool` | `false` | no |
| <a name="input_tracing_tags_prefix"></a> [tracing\_tags\_prefix](#input\_tracing\_tags\_prefix) | Default prefix for generated tracing tags | `string` | `"avm_"` | no |
| <a name="input_vnet_rule_name_prefix"></a> [vnet\_rule\_name\_prefix](#input\_vnet\_rule\_name\_prefix) | Specifies prefix for vnet rule names. | `string` | `"postgresql-vnet-rule-"` | no |
| <a name="input_vnet_rules"></a> [vnet\_rules](#input\_vnet\_rules) | The list of maps, describing vnet rules. Valud map items: name, subnet\_id. | `list(map(string))` | `[]` | no |
## Resources

| Name | Type |
|------|------|
| [azurerm_postgresql_configuration.db_configs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_configuration) | resource |
| [azurerm_postgresql_database.dbs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_database) | resource |
| [azurerm_postgresql_firewall_rule.firewall_rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_firewall_rule) | resource |
| [azurerm_postgresql_server.server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_server) | resource |
| [azurerm_postgresql_virtual_network_rule.vnet_rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_virtual_network_rule) | resource |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_administrator_login"></a> [administrator\_login](#output\_administrator\_login) | The Administrator login for the PostgreSQL Server |
| <a name="output_administrator_password"></a> [administrator\_password](#output\_administrator\_password) | The Password associated with the `administrator_login` for the PostgreSQL Server |
| <a name="output_database_ids"></a> [database\_ids](#output\_database\_ids) | The list of all database resource ids |
| <a name="output_firewall_rule_ids"></a> [firewall\_rule\_ids](#output\_firewall\_rule\_ids) | The list of all firewall rule resource ids |
| <a name="output_server_fqdn"></a> [server\_fqdn](#output\_server\_fqdn) | The fully qualified domain name (FQDN) of the PostgreSQL server |
| <a name="output_server_id"></a> [server\_id](#output\_server\_id) | The resource id of the PostgreSQL server |
| <a name="output_server_name"></a> [server\_name](#output\_server\_name) | The name of the PostgreSQL server |
| <a name="output_vnet_rule_ids"></a> [vnet\_rule\_ids](#output\_vnet\_rule\_ids) | The list of all vnet rule resource ids |
# 🚀 Built by opsZero!

<a href="https://opszero.com"><img src="https://opszero.com/img/common/opsZero-Logo-Large.webp" width="300px"/></a>

[opsZero](https://opszero.com) provides software and consulting for Cloud + AI. With our decade plus of experience scaling some of the world’s most innovative companies we have developed deep expertise in Kubernetes, DevOps, FinOps, and Compliance.

Our software and consulting solutions enable organizations to:

- migrate workloads to the Cloud
- setup compliance frameworks including SOC2, HIPAA, PCI-DSS, ITAR, FedRamp, CMMC, and more.
- FinOps solutions to reduce the cost of running Cloud workloads
- Kubernetes optimized for web scale and AI workloads
- finding underutilized Cloud resources
- setting up custom AI training and delivery
- building data integrations and scrapers
- modernizing onto modern ARM based processors

We do this with a high-touch support model where you:

- Get access to us on Slack, Microsoft Teams or Email
- Get 24/7 coverage of your infrastructure
- Get an accelerated migration to Kubernetes

Please [schedule a call](https://calendly.com/opszero-llc/discovery) if you need support.

<br/><br/>

<div style="display: block">
  <img src="https://opszero.com/img/common/aws-advanced.png" alt="AWS Advanced Tier" width="150px" >
  <img src="https://opszero.com/img/common/aws-devops-competency.png" alt="AWS DevOps Competency" width="150px" >
  <img src="https://opszero.com/img/common/aws-eks.png" alt="AWS EKS Delivery" width="150px" >
  <img src="https://opszero.com/img/common/aws-public-sector.png" alt="AWS Public Sector" width="150px" >
</div>
<!-- END_TF_DOCS -->