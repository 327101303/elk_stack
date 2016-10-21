FROM hub.local.ethicall.cn/tool/ubuntu:14.04.3
ADD sources.list  /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y wget supervisor python-setuptools libpq-dev python-dev
RUN easy_install pip



COPY requirements.txt /tmp/
RUN pip install -r  /tmp/requirements.txt &&\
    pip install unittest2  &&\
    pip install pypinyin
