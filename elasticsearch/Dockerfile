FROM  hub.local.ethicall.cn/elkstack/elasticsearch:5.1.1

ADD ./readonlyrest-1.13.1_es5.1.1.zip /tmp
ADD ./x-pack-5.1.1.zip /tmp
ENV ES_JAVA_OPTS="-Des.path.conf=/etc/elasticsearch"

RUN elasticsearch-plugin install --batch file:///tmp/readonlyrest-1.13.1_es5.1.1.zip
RUN elasticsearch-plugin install --batch file:///tmp/x-pack-5.1.1.zip
RUN elasticsearch-plugin install org.codelibs:elasticsearch-dataformat:5.0.0
#RUN elasticsearch-plugin install --batch  x-pack
ADD  ./jieba     /usr/share/elasticsearch/plugins/jieba/
RUN mkdir -p /usr/share/elasticsearch/config/stopwords \
    && mkdir -p /usr/share/elasticsearch/config/synonyms \
    && cp /usr/share/elasticsearch/plugins/jieba/dic/stopwords.txt /usr/share/elasticsearch/config/stopwords \
    && cp /usr/share/elasticsearch/plugins/jieba/dic/synonyms.txt /usr/share/elasticsearch/config/synonyms

CMD ["-E", "network.host=0.0.0.0", "-E", "discovery.zen.minimum_master_nodes=1"]
