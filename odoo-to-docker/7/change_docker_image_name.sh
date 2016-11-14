#!/bin/bash
sleep 20
#New_Tag=`docker images|grep v$bamboo_buildNumber|awk -F ' ' '{print $3}'`
docker tag hub.local.ethicall.cn/ethicall/ethicall:v$bamboo_buildNumber registry.cn-hangzhou.aliyuncs.com/zhangjun/ethicall:v$bamboo_buildNumber
