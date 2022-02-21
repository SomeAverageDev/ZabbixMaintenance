#!/bin/sh

# create
zabbix_sender -c /etc/zabbix/zabbix_agentd.conf -s "Zabbix server" -k ZabbixMaintenance -o "action=create;duration=10;comment=test maintenance A test-host1 with 1 tag with contains value;host=test-host1;tag=tag1:equals1"
sleep 3
zabbix_sender -c /etc/zabbix/zabbix_agentd.conf -s "Zabbix server" -k ZabbixMaintenance -o "action=create;duration=20;comment=test maintenance B test-host2 with 2 tags and no data collection;host=test-host2;tag=CAP_CATEGORY:OS;tag=tag2:contains2:2;nodata"
sleep 3
zabbix_sender -c /etc/zabbix/zabbix_agentd.conf -s "Zabbix server" -k ZabbixMaintenance -o "action=create;duration=7000;comment=test maintenance C test-host3 no tags;host=test-host3"
sleep 3
zabbix_sender -c /etc/zabbix/zabbix_agentd.conf -s "Zabbix server" -k ZabbixMaintenance -o "action=create;duration=30;comment=test maintenance D with group TEST_HGP and 1 tag equal;group=TEST_HGP;tag=CAP_CATEGORY:OS"
sleep 3
zabbix_sender -c /etc/zabbix/zabbix_agentd.conf -s "Zabbix server" -k ZabbixMaintenance -o "action=create;duration=30;comment=test maintenance E with group TEST1_HGP no tags;group=TEST1_HGP"
sleep 20
zabbix_sender -c /etc/zabbix/zabbix_agentd.conf -s "Zabbix server" -k ZabbixMaintenance -o "action=create;comment=test maintenance F with no duration and no data collection;nodata;host=test-host2"
sleep 20

#delete
zabbix_sender -c /etc/zabbix/zabbix_agentd.conf -s "Zabbix server" -k ZabbixMaintenance -o "action=delete;host=test-host1;tag=tag1:equals1"
sleep 3
zabbix_sender -c /etc/zabbix/zabbix_agentd.conf -s "Zabbix server" -k ZabbixMaintenance -o "action=delete;host=test-host2;tag=CAP_CATEGORY:OS;tag=tag2:contains2:2"
sleep 3
zabbix_sender -c /etc/zabbix/zabbix_agentd.conf -s "Zabbix server" -k ZabbixMaintenance -o "action=delete;group=TEST_HGP;tag=CAP_CATEGORY:OS"
sleep 3
zabbix_sender -c /etc/zabbix/zabbix_agentd.conf -s "Zabbix server" -k ZabbixMaintenance -o "action=delete;group=TEST1_HGP"
sleep 3
zabbix_sender -c /etc/zabbix/zabbix_agentd.conf -s "Zabbix server" -k ZabbixMaintenance -o "action=delete;host=test-host3"
sleep 3
zabbix_sender -c /etc/zabbix/zabbix_agentd.conf -s "Zabbix server" -k ZabbixMaintenance -o "action=delete;host=test-host2"
