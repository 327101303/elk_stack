FROM ubuntu:14.04.3 
ADD sources.list  /etc/apt/sources.list
RUN apt-get update && apt-get install -y wget
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" >>/etc/apt/sources.list.d/pgdg.list && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - && \
    apt-get update && \
    apt-get install -y postgresql-9.4 openssh-server supervisor
RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor
COPY 20161019all.tar.gz  /tmp
#RUN chown -R postgres.postgres /var/lib/postgresql/9.4/main
RUN echo "host    all             all             192.168.2.0/24            trust" >>/etc/postgresql/9.4/main/pg_hba.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 22 5432
CMD ["/usr/bin/supervisord"]
