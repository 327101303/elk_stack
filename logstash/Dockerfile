FROM  hub.local.ethicall.cn/elkstack/logstash:5.1.1

ADD GeoLite2-City.mmdb.gz /etc/logstash/

#RUN curl -O "http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz"
RUN gunzip /etc/logstash/GeoLite2-City.mmdb.gz
#RUN gunzip GeoLite2-City.mmdb.gz
# Add your logstash plugins setup here
# Example: RUN logstash-plugin install logstash-filter-json
