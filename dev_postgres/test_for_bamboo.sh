#!/bin/bash
echo $bamboo_build_working_directory
echo $today
time=`date +%Y%m%d`
echo $time
echo $system_`date +%Y%m%d`
docker tag 8409f73da134 hub.local.ethicall.cn/postgres/pro_postgres:v1$time
docker tag 8409f73da134 hub.local.ethicall.cn/postgres/pro_postgres:v$today
docker tag 8409f73da134 hub.local.ethicall.cn/postgres/pro_postgres:v$system_`date +%Y%m%d`
