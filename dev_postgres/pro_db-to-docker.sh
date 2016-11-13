#!/bin/bash
Filename=ethicall.`date +%Y%m%d`-cron
Dname=dev_postgresql_$bamboo_planKey$bamboo_buildNumber
echo $Filename
echo "ssh admin@nas.ethicall.cn  '[ -f /backup/$Filename ]'"
ssh admin@nas.ethicall.cn  'test  -f /backup/'$Filename' '


if [[ $? = 0 ]];
   then
        scp admin@nas.ethicall.cn:/backup/$Filename ./
        docker run -d -p 5432 --name=$Dname  hub.local.ethicall.cn/tool/postgres:9.4

        Port=`docker ps |grep $Dname|awk -F ':' '{print $3}'|awk -F '-' '{print $1}'`
        sleep 5
        echo "初始化数据库，创建数据库ethicall和角色odoo-ethicall"
        psql -h 192.168.2.39 -p $Port -U postgres -f /mnt/opt/postgresql-to-docker/init_db.sql
        sleep 5
        echo "导入数据"
        pg_restore -h 192.168.2.39 -p $Port -U postgres -d ethicall -v ./$Filename
        sleep 10
        echo "清理敏感信息"
        psql -h 192.168.2.39 -p $Port -U postgres -f /mnt/opt/postgresql-to-docker/run_once.sql
        sleep 10
        docker stop $Dname
        sleep 5
        docker commit $Dname hub.local.ethicall.cn/postgres/pro_postgres:v`date +%Y%m%d`
else
        echo "当日的数据库备份文件不在本地nas上"
fi
