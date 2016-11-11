-- 清空微信公众号和服务号
\connect ethicall
update er_base_wechat_enterprise_app set redirect_domain='xxx.ethicall.cn',recall_url='http://xxx.ethicall.cn/wechat/enterprise/urlrecall?corpid=xxx',aeskey='xxx';
update er_base_wechat_enterprise  set corpid='xxx',qrcode='https://qy.weixin.qq.com/cgi-bin/redirect?url=xxx',name='医时XXX';
UPDATE er_base_wechat_enterprise_app_menu set value='xxx';
update "public"."er_base_wechat_service" set recall_url='xxx',app_id='xxx',bus_url='xxx',js_url='xxx',aeskey='xxx',secret_id='xxx',token='xxx';
update "public"."er_base_wechat_service_menu" set value='https://xxx';
-- 修改微信支付相关参数
update er_base_wechat_ent_payment_conf set mchid='1111111',apikey='adsadsfasdf',corpid='wx1111111',corpsecret='adadsf';
-- 修改odoo-ethicall用户的密码
-- alter user "odoo-ethicall" with password 'eth';
