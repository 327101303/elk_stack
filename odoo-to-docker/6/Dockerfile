FROM hub.local.ethicall.cn/tool/python-to-odoo2.7:v6
RUN set -x; \
	apt-get update \
	&& apt-get install -y wget \
		supervisor \
		openssh-server \
		nginx \
	&& mkdir -p /opt/ethicall/web_html5 \
	&& mkdir -p /var/run/sshd \ 
	&& mkdir -p /var/log/supervisor \ 
	&& mkdir -p /var/log/odoo \
	&& useradd openerp \
	&& chown -R openerp.openerp /var/log/odoo 
ADD odoo /opt/ethicall/odoo
ADD ethicall_frontend /opt/ethicall/ethicall_frontend
COPY changename.sh /tmp/changename.sh
#RUN sh /tmp/changename.sh
ADD ethicall_platform /opt/ethicall/ethicall_platform
ADD eroad_base_addons /opt/ethicall/eroad_base_addons
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY openerp-server.conf /tmp/openerp-server.conf
COPY nginx.conf /etc/nginx/conf.d/loadbalance.conf
RUN chown -R openerp.openerp /opt/ethicall 
COPY rc.local /etc/rc.local
RUN chmod 755 /etc/rc.local

EXPOSE 80 48369
CMD ["/usr/bin/supervisord"]
