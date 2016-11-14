FROM hub.local.ethicall.cn/ethicall/odoo8:v15
RUN set -x; \
	&& mkdir -p /opt/ethicall/web_html5 \
	&& mkdir -p /var/run/sshd \
	&& mkdir -p /var/log/supervisor \
	&& mkdir -p /var/log/odoo \
	&& useradd openerp \
	&& chown -R openerp.openerp /var/log/odoo
COPY ethicall_frontend /opt/ethicall/ethicall_frontend
COPY entrypoint.sh /entrypoint.sh
RUN  chmod 744 /entrypoint.sh
COPY ethicall_platform /opt/ethicall/ethicall_platform
COPY eroad_base_addons /opt/ethicall/eroad_base_addons
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY openerp-server-test.conf /tmp/openerp-server-test.conf
COPY nginx.conf /etc/nginx/conf.d/loadbalance.conf
RUN  rm -rf /etc/nginx/sites-enabled/*
RUN chown -R openerp.openerp /opt/ethicall

EXPOSE 80 48369
CMD ["/entrypoint.sh"]
