CREATE ROLE "odoo-ethicall" login PASSWORD 'eth' SUPERUSER CREATEDB CREATEROLE;
UPDATE pg_authid SET rolcatupdate=True WHERE rolname = 'odoo-ethicall';
create database ethicall owner "odoo-ethicall" ;
