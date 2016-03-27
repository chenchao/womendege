create or replace view activity_product_view as
SELECT
ap.activity_id as activityId,
ap.product_id as productId,
p.product_sub_code as productCode,
p.product_sub_name as productName,
i.picture_url as productImg,
p.product_price as price,
p.product_unit as unit,
a.discount as discount,
a.activity_type as activityType
from activity_product ap, activity a,product_detail p,product_picture i
where ap.activity_id=a.id and ap.product_id=p.id and ap.product_id=i.id and p.product_shelves=1

---插入资源菜单
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (1,'ENABLE','main',1,'主页','1.',1,0,'MENU','/main','fa fa-home');

--系统管理
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (2,'ENABLE','system',1,'系统设置','2.',2,0,'MENU','/system','glyphicon glyphicon-cog');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (3,'ENABLE','system-resource',2,'资源管理','2.3.',1,2,'MENU','/system/resource','glyphicon glyphicon-th-list');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (4,'ENABLE','system-role',2,'角色管理','2.4.',2,2,'MENU','/system/role','glyphicon glyphicon-tree-conifer');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (5,'ENABLE','system-user',2,'用户管理','2.5.',3,2,'MENU','/system/user','icon-users');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (6,'ENABLE','system-employee',2,'员工管理','2.6.',4,2,'MENU','/system/employee','glyphicon glyphicon-user');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (7,'ENABLE','system-organization',2,'组织管理','2.7.',5,2,'MENU','/system/organization','glyphicon glyphicon-road');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (8,'ENABLE','system-position',2,'岗位管理','2.8.',6,2,'MENU','/system/position','icon-graduation');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (9,'ENABLE','system-team',2,'团队管理','2.9.',7,2,'MENU','/system/team','glyphicon glyphicon-thumbs-up');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (10,'ENABLE','system-sysitem',2,'数据字典','2.10.',8,2,'MENU','/system/sysitem','icon-docs');

--权限管理
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (20,'ENABLE','authority',1,'第三方权限','20.',3,0,'MENU','/authority','icon-trophy');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (21,'ENABLE','authority-user-third',2,'第三方用户','20.21.',1,20,'MENU','/authority/user-third','icon-user-follow');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (22,'ENABLE','authority-system-third',2,'第三方系统','20.22.',2,20,'MENU','/authority/system-third','icon-anchor');

--应用管理
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (40,'ENABLE','application',1,'应用管理','40.',5,0,'MENU','/application','fa fa-ticket');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (41,'ENABLE','application-list',2,'应用清单','40.41.',1,40,'MENU','/application/list','icon-list');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (42,'ENABLE','application-version',2,'应用版本','40.42.',2,40,'MENU','/application/version','icon-drawer');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (43,'ENABLE','application-setup',2,'应用设置','40.43.',3,40,'MENU','/application/setup','glyphicon glyphicon-certificate');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (44,'ENABLE','application-role',2,'角色管理','40.44.',4,40,'MENU','/application/role','icon-eyeglasses');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (45,'ENABLE','application-module',2,'模块管理','40.45.',5,40,'MENU','/application/module','icon-layers');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (46,'ENABLE','application-function',2,'功能管理','40.46.',6,40,'MENU','/application/function','icon-puzzle');
--安全管理
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (50,'ENABLE','safety',1,'安全管理','50.',6,0,'MENU','/safety','icon-badge');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (51,'ENABLE','safety-channel',2,'设备管理','50.51',1,50,'MENU','/safety/channel','glyphicon glyphicon-phone');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (52,'ENABLE','safety-certificate',2,'证书管理','50.52.',3,50,'MENU','/safety/certificate','icon-book-open');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (53,'ENABLE','safety-message-send',2,'消息发送','50.53.',4,50,'MENU','/safety/message-send','icon-envelope-letter');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (54,'ENABLE','safety-message-search',2,'消息查询','50.54.',5,50,'MENU','/safety/message-search','glyphicon glyphicon-comment');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (55,'ENABLE','safety-status',2,'设备状态','50.55.',6,50,'MENU','/safety/status','glyphicon glyphicon-screenshot');

--平台管理
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (60,'ENABLE','platform',1,'平台管理','60.',7,0,'MENU','/platform','fa fa-flickr');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (61,'ENABLE','platform-service',2,'客服管理','60.61.',1,60,'MENU','/platform/service','glyphicon glyphicon-user');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (62,'ENABLE','platform-feedback',2,'意见反馈','60.62.',2,60,'MENU','/platform/opinion-feedback','glyphicon glyphicon-star');

--导入管理
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (70,'ENABLE','import',1,'导入管理','70.',8,0,'MENU','/import','glyphicon glyphicon-arrow-down');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (71,'ENABLE','import-user',2,'用户导入','70.71.',1,70,'MENU','/import/user','icon-user-follow');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (73,'ENABLE','import-org-user',2,'组织用户导入','70.73.',3,70,'MENU','/import/org-user','icon-user-following');
--INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (72,'ENABLE','import-oa-user',2,'oa用户更新','70.72.',3,70,'MENU','/import/oa-user','icon-user-following');

---插入基本用户
INSERT INTO kn_user (id,login_name,name,email,password,salt,status,create_time,user_online) VALUES (1,'admin','管理员','admin@kingnode.com','691b14d79bf0fa2215f155235df5e670b64394cc','7efbd59d9741d34f','ENABLE',1406532246618,0);

--插入角色
INSERT INTO kn_role (id,active,code,description,name) VALUES (1,'ENABLE','Admin','admin:view,admin:edit','管理员权限');
INSERT INTO kn_role (id,active,code,description,name) VALUES (2,'ENABLE','User','user:view,user:edit','基本用户权限');

--插入用户角色关系表
INSERT INTO kn_user_role (role_id,user_id) VALUES (1,1);


--插入角色资源关系表
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,1);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,2);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,3);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,4);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,5);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,6);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,7);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,8);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,9);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,10);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,20);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,21);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,22);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,40);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,41);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,42);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,43);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,44);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,45);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,46);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,50);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,51);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,52);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,53);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,54);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,55);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,60);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,61);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,62);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,70);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,71);
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,73);
--INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,72);

--插入序列值
INSERT INTO KN_TABLE_SEQUNCE (SEQUENCE_NAME,SEQUENCE_NEXT_HI_VALUE) VALUES ('kn_user',1);
INSERT INTO KN_TABLE_SEQUNCE (SEQUENCE_NAME,SEQUENCE_NEXT_HI_VALUE) VALUES ('kn_role',1);
INSERT INTO KN_TABLE_SEQUNCE (SEQUENCE_NAME,SEQUENCE_NEXT_HI_VALUE) VALUES ('kn_resource',2);
