# ZabbixMaintenance
Zabbix Template and related media type in order to manage dynamic maintenance on Zabbix using a local agent trapper item
You will have to create the related action as "Actions" cannot be imported.

# Description
This hack allows the creation of Zabbix maintenances from the agent side using a specific trapper item.
The trapper item triggers an associated action that create or delete the maintenance.

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

# Usage & Parameters
### General usage
zabbix_sender -c /etc/zabbix/zabbix_agentd.conf -s "Zabbix server" -k ZabbixMaintenance -o "<data>"

### Data message parameters
#### Mandatory parameters
action=<create|delete>
comment=<maintenance comment>
host=<host name>
or
group=<host group name>

#### Optional parameters
tag=<tag name>:<tag value>(:<operator[0|2]]>), default operator 0 (equals)
duration=<maintenance duration in minutes>, default 60 minutes
nodata, default maintenance is with data collection, use nodata to disable data collection

# Examples
### Creating a maintenance
```
zabbix_sender -c /etc/zabbix/zabbix_agentd.conf -s "Zabbix server" -k ZabbixMaintenance -o "action=create;comment=test maintenance B test-host2 with 2 tags and no data collection;host=test-host2;tag=SYSTEM:Linux;tag=tag1:contains1:2;nodata"
zabbix_sender -c /etc/zabbix/zabbix_agentd.conf -s "Zabbix server" -k ZabbixMaintenance -o "action=create;duration=30;comment=test maintenance D with group TEST_HGP and 1 tag equal;group=TEST_HGP;tag=SYSTEM:windows"
```

### Deleting a maintenance
```
zabbix_sender -c /etc/zabbix/zabbix_agentd.conf -s "Zabbix server" -k ZabbixMaintenance -o "action=delete;group=TEST1_HGP"
```


# Testing
Tested on Zabbix version >= 5.0.4
you can test various use cases with the [test file](Test/zabbix.maintenance.test.sh)