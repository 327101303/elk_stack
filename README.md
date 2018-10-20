# elk-stack docker-compose
已经集成了readonlyrest权限控制插件
## 相关账户密码：
>      auth_key: logstash:logstashethicallcn
>      auth_key: elastic:elasticl@ethical.cn
>      auth_key: rw:dev
>      auth_key: ethicall:o0lQc7l*48U$XnRd
## 启动docker-compose请注意配置文件中的端口号
`services:
  elasticsearch:
    ports:
      - "9200:9200"
      - "9300:9300"
  logstash:
    ports:
      - "5000:5000"
  kibana:
    ports:
      - "5601:5601"
  elk-redis:
    ports:
      - "6379:6379"`
### 需要注意的是nat映射到宿主机的端口不要与当前已经存在的端口冲突

# 快照的备份与恢复
* 备份前需要在elasticsearch配置文件中指明备份仓库的路径  
`    ###repo
    path.repo: ["/usr/share/elasticsearch/data/backup"]
`
* 在kibana的dev_tools中发送put请求，创建快照仓库及路径  
`    PUT /_snapshot/my_backup
    {
      "type": "fs",
      "settings": {
      "location": "/usr/share/elasticsearch/data/backup/es_backup"
      }
    }`  
* 获取本节点中快照仓库位置  
`    GET /_snapshot/my_backup`  
* 获取快照信息
`    GET /_snapshot/my_backup/_all`  


### 创建快照
* 其中my_backup为快照仓库的名字，snapshort_1为快照名称  
`PUT /_snapshot/my_backup/snapshot_1?wait_for_completion=true
`
* 查看刚创建的快照信息  
`GET /_snapshot/my_backup/snapshot_1
`
* 将创建好的快照文件，拉回本地，放在本地elk实例的快照仓库路径下  

### 文件结构

    root@office:~/test/elk_stack# tree -L 3
    .
    ├── data
    │   ├── backup
    │   │   ├── es_backup
    │   │   └── es_backup_20170125_1100.tar.gz
    │   └── nodes
    │       └── 0
    ├── docker-compose.yml
    ├── elasticsearch
    │   ├── config
    │   │   └── elasticsearch.yml
    │   ├── Dockerfile
    │   └── readonlyrest-1.13.1_es5.1.1.zip
    ├── kibana
    │   ├── config
    │   │   └── kibana.yml
    │   └── Dockerfile
    ├── LICENSE
    ├── logstash
    │   ├── config
    │   │   ├── logstash.conf
    │   │   ├── patterns
    │   │   └── pki
    │   ├── Dockerfile
    │   ├── GeoLite2-City.mmdb.gz
    │   └── GeoLiteCity.dat.gz
    └── README.md

    13 directories, 13 files
    
## 执行恢复
`POST /_snapshot/my_backup/snapshot_1/_restore`

### 如果恢复报错提示500.某个索引已经打开比如：cannot restore index [.kibana] because it's open”   
执行：   

`POST /my_index/_close`   
`POST /my_index/_open`



### 更新授权
`https://www.elastic.co/guide/en/x-pack/current/installing-license.html`