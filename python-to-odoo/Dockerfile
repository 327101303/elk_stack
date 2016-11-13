FROM ubuntu:14.04.3
COPY requirements.txt /tmp/
ADD sources.list  /etc/apt/sources.list
RUN  mkdir /root/.pip
COPY pip.conf /root/.pip/pip.conf
RUN set -x; \
        apt-get update \
        && apt-get install -y --no-install-recommends \
        	wget \
        	supervisor \
        	python-setuptools \
        	libldap2-dev \
		libxml2-dev \
		libxslt1-dev \
        	python-lxml \
        	libsasl2-dev \
        	python-dev \
        	libldap2-dev \
        	libssl-dev \
        	python-psycopg2 \
        	libpq-dev \
        	python-dev \
        	gcc \
        	make \
        	build-essential \
        	libffi-dev \
		python-pip \
        &&  pip install -r  /tmp/requirements.txt \
	&&  pip install unittest2 \
	&&  pip install pypinyin \
	&&  pip install redis \
	&&  pip install xlrd \
	&&  pip install Crypto \
	&&  pip install pycrypto
