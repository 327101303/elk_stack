FROM  hub.local.ethicall.cn/elkstack/elasticsearch:5.1.1

#ADD ./readonlyrest-1.13.1_es5.1.1.zip /tmp
ENV ES_JAVA_OPTS="-Des.path.conf=/etc/elasticsearch"

#RUN elasticsearch-plugin install --batch file:///tmp/readonlyrest-1.13.1_es5.1.1.zip
#RUN elasticsearch-plugin install --batch  x-pack

CMD ["-E", "network.host=0.0.0.0", "-E", "discovery.zen.minimum_master_nodes=1"]
