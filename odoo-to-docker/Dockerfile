FROM hub.local.ethicall.cn/tool/python-to-odoo2.7:v6
RUN set -x; \
	apt-get update \
	&& apt-get install -y wget \
		supervisor \
		openssh-server \
	&& mkdir -p /opt/ethicall \
	&& mkdir -p /var/run/sshd \ 
	&& mkdir -p /var/log/supervisor \ 
	&& mkdir -p /var/log/odoo \
	&& useradd openerp \
	&& chown -R openerp.openerp /var/log/odoo 
ADD odoo /opt/ethicall/odoo
ADD ethicall_platform /opt/ethicall/ethicall_platform
ADD ethicall_frontend /opt/ethicall/ethicall_forntend
ADD eroad_base_addons /opt/ethicall/eroad_base_addons
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY openerp-server.conf /tmp/openerp-server.conf
RUN chown -R openerp.openerp /opt/ethicall 

EXPOSE 48369 22
CMD ["/usr/bin/supervisord"]
