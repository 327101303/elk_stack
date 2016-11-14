#!/bin/bash
file=`date +%Y%m%d-%H%M%S`
Sfile=/opt/ethicall/ethicall_frontend
Mfile=/opt/ethicall/web_html5/`date +%Y%m%d-%H%M%S`
Dfile=/mnt/document/odoo_document_dev/ethicall/ethicall_web_html5/`date +%Y%m%d-%H%M%S`
Lockfile=/tmp/changename.lock


if [ -e $Lockfile  ]
then
exit
elif [ -d $Sfile ]
then
mv $Sfile $Mfile
ln -s $Mfile $Dfile
chown -R openerp.openerp $Dfile
touch $Lockfile
fi
/usr/bin/supervisord
