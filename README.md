# ZabbixMaintenance
Template and related action to manage dynamic maintenance on Zabbix using a local agent trapper item

# Description


# Installation
### Zabbix template
Import the [template file](Template/zbx_export_templates_ZabbixMaintenance.xml)

### Zabbix media type
Import the [media type file](MediaTypes/zbx_export_mediatypes_ZabbixMaintenance.xml)

### Create the associated action
Go to "Configuration > Actions" and click on "Create action" button.
- Set "name" to ZabbixMaintenance
- Create a new condition with "Trigger name" > "contains" > "ZabbixMaintenance"
- In "Operations" tab, add on operation that sends to "ZabbixMaintenance" the message "{ITEM.VALUE}"


# Testing