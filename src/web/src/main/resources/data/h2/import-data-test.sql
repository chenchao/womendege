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
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url,icon) VALUES (72,'ENABLE','import-oa-user',2,'oa用户更新','70.72.',3,70,'MENU','/import/oa-user','icon-user-following');


--插入模块
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url) VALUES (200,'ENABLE','',1,'移动平台','200.',0,0,'MODULE','');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url) VALUES (201,'ENABLE','',1,'我的工作台','201.',0,200,'MODULE','');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url) VALUES (202,'ENABLE','',1,'财务类','202.',0,200,'MODULE','');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url) VALUES (203,'ENABLE','',1,'企业协同','203.',0,200,'MODULE','');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url) VALUES (204,'ENABLE','',1,'客户关系','204.',0,200,'MODULE','');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url) VALUES (205,'ENABLE','',1,'人力资源','205.',0,200,'MODULE','');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url) VALUES (206,'ENABLE','',1,'商务分析','206.',0,200,'MODULE','');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url) VALUES (207,'ENABLE','',1,'企业资产管理','207.',0,200,'MODULE','');

--插入功能
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url) VALUES (250,'ENABLE','',1,'诺德扫描','',0,200,'FUNCTION','');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url) VALUES (251,'ENABLE','',1,'诺德OA','',0,200,'FUNCTION','');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url) VALUES (252,'ENABLE','',1,'诺德签到','',0,200,'FUNCTION','');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url) VALUES (253,'ENABLE','',1,'盈诺德APPS','',0,200,'FUNCTION','');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url) VALUES (254,'ENABLE','',1,'盈诺德','',0,200,'FUNCTION','');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url) VALUES (255,'ENABLE','',1,'诺德ECM','',0,200,'FUNCTION','');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url) VALUES (256,'ENABLE','',1,'盈诺德BI','',0,200,'FUNCTION','');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url) VALUES (257,'ENABLE','',1,'诺德巡店','',0,200,'FUNCTION','');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url) VALUES (258,'ENABLE','',1,'诺德ISP','',0,200,'FUNCTION','');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url) VALUES (259,'ENABLE','',1,'诺德PM','',0,200,'FUNCTION','');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url) VALUES (260,'ENABLE','',1,'诺德CRM','',0,200,'FUNCTION','');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url) VALUES (261,'ENABLE','',1,'诺德门店','',0,200,'FUNCTION','');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url) VALUES (262,'ENABLE','',1,'诺德EAM','',0,200,'FUNCTION','');
INSERT INTO kn_resource (id,active,code,depth,name,path,seq,sup_id,type,url) VALUES (263,'ENABLE','',1,'诺德HR','',0,200,'FUNCTION','');


---插入基本用户
INSERT INTO kn_user (id,login_name,name,email,password,salt,status,create_time,user_online) VALUES (1,'admin','管理员','admin@kingnode.com','691b14d79bf0fa2215f155235df5e670b64394cc','7efbd59d9741d34f','ENABLE',1406532246618,0);
INSERT INTO kn_user (id,login_name,name,email,password,salt,status,create_time,user_online) VALUES (2,'ly','刘云','liuyun@kingnode.com','691b14d79bf0fa2215f155235df5e670b64394cc','7efbd59d9741d34f','ENABLE',1406532246618,0);
INSERT INTO kn_user (id,login_name,name,email,password,salt,status,create_time,user_online) VALUES (3,'zzl','周芷琳','zzl@kingnode.com','691b14d79bf0fa2215f155235df5e670b64394cc','7efbd59d9741d34f','ENABLE',1406532246618,0);
INSERT INTO kn_user (id,login_name,name,email,password,salt,status,create_time,user_online) VALUES (4,'tss','谭思思,','tss@kingnode.com','691b14d79bf0fa2215f155235df5e670b64394cc','7efbd59d9741d34f','ENABLE',1406532246618,0);
INSERT INTO kn_user (id,login_name,name,email,password,salt,status,create_time,user_online) VALUES (5,'ks','康森','ks@kingnode.com','691b14d79bf0fa2215f155235df5e670b64394cc','7efbd59d9741d34f','ENABLE',1406532246618,0);
INSERT INTO kn_user (id,login_name,name,email,password,salt,status,create_time,user_online) VALUES (6,'zmx','周明夕','zmx@kingnode.com','691b14d79bf0fa2215f155235df5e670b64394cc','7efbd59d9741d34f','ENABLE',1406532246618,0);
INSERT INTO kn_user (id,login_name,name,email,password,salt,status,create_time,user_online) VALUES (7,'sl','苏丽','sl@kingnode.com','691b14d79bf0fa2215f155235df5e670b64394cc','7efbd59d9741d34f','ENABLE',1406532246618,0);

--插入角色
INSERT INTO kn_role (id,active,code,description,name) VALUES (1,'ENABLE','Admin','admin:view,admin:edit','管理员权限');
INSERT INTO kn_role (id,active,code,description,name) VALUES (2,'ENABLE','User','user:view,user:edit','基本用户权限');

--插入用户角色关系表
INSERT INTO kn_user_role (role_id,user_id) VALUES (1,1);
INSERT INTO kn_user_role (role_id,user_id) VALUES (2,2);
INSERT INTO kn_user_role (role_id,user_id) VALUES (2,3);
INSERT INTO kn_user_role (role_id,user_id) VALUES (2,4);
INSERT INTO kn_user_role (role_id,user_id) VALUES (2,5);
INSERT INTO kn_user_role (role_id,user_id) VALUES (2,6);
INSERT INTO kn_user_role (role_id,user_id) VALUES (2,7);


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
INSERT INTO kn_role_resource (role_id,res_id) VALUES (1,72);


--插入组织
INSERT INTO kn_organization (id,sup_id,code,name,path,depth,org_type,seq,active) VALUES (1,0,'KND','盈诺德','1.',1,'COMPANY',1,'ENABLE');
INSERT INTO kn_organization (id,sup_id,code,name,path,depth,org_type,seq,active) VALUES (2,1,'KNDM','移动事业部','1.2.',2,'DEPARTMENT',2,'ENABLE');
INSERT INTO kn_organization (id,sup_id,code,name,path,depth,org_type,seq,active) VALUES (3,1,'KNDM','总经理办公室','1.2.',2,'DEPARTMENT',2,'ENABLE');
INSERT INTO kn_organization (id,sup_id,code,name,path,depth,org_type,seq,active) VALUES (4,1,'KNDM','财务部','1.2.',2,'DEPARTMENT',2,'ENABLE');
INSERT INTO kn_organization (id,sup_id,code,name,path,depth,org_type,seq,active) VALUES (5,1,'KNDM','知识管理中心','1.2.',2,'DEPARTMENT',2,'ENABLE');
INSERT INTO kn_organization (id,sup_id,code,name,path,depth,org_type,seq,active) VALUES (6,1,'KNDM','人力资源部门','1.2.',2,'DEPARTMENT',2,'ENABLE');
INSERT INTO kn_organization (id,sup_id,code,name,path,depth,org_type,seq,active) VALUES (7,1,'KNDM','HCM事业部','1.2.',2,'DEPARTMENT',2,'ENABLE');
INSERT INTO kn_organization (id,sup_id,code,name,path,depth,org_type,seq,active) VALUES (8,1,'KNDM','技术服务中心','1.2.',2,'DEPARTMENT',2,'ENABLE');
INSERT INTO kn_organization (id,sup_id,code,name,path,depth,org_type,seq,active) VALUES (9,1,'KNDM','市场销售部','1.2.',2,'DEPARTMENT',2,'ENABLE');
INSERT INTO kn_organization (id,sup_id,code,name,path,depth,org_type,seq,active) VALUES (10,1,'KNDM','咨询业务部','1.2.',2,'DEPARTMENT',2,'ENABLE');


--增加员工
INSERT INTO kn_employee (id,user_id,LOGIN_NAME,user_name,user_system,user_type,weixin_id) VALUES (2,1002,'ly','刘云','PS','employee','dfaffdfdff');
INSERT INTO kn_employee (id,user_id,LOGIN_NAME,user_name,user_system,user_type,weixin_id) VALUES (3,1003,'zzl','周芷琳','','employee','eefefd232');
INSERT INTO kn_employee (id,user_id,LOGIN_NAME,user_name,user_system,user_type,weixin_id) VALUES (4,1004,'tss','谭思思','PS','employee','23232323');
INSERT INTO kn_employee (id,user_id,LOGIN_NAME,user_name,user_system,user_type,weixin_id) VALUES (5,1005,'ks','康森','PS','employee','fer2232erewr');
INSERT INTO kn_employee (id,user_id,LOGIN_NAME,user_name,user_system,user_type,weixin_id) VALUES (6,1006,'zmx','周明夕','PS','employee','fewewr323');
INSERT INTO kn_employee (id,user_id,LOGIN_NAME,user_name,user_system,user_type,weixin_id) VALUES (7,1007,'sl','苏丽','PS','employee','fewewr323');

--增加员工与组织对应关系
INSERT INTO kn_employee_organization(charge,major,emp_id,org_id) VALUES(0,1,2,2);
INSERT INTO kn_employee_organization(charge,major,emp_id,org_id) VALUES(0,1,4,3);
INSERT INTO kn_employee_organization(charge,major,emp_id,org_id) VALUES(0,1,5,4);
INSERT INTO kn_employee_organization(charge,major,emp_id,org_id) VALUES(0,1,6,5);
INSERT INTO kn_employee_organization(charge,major,emp_id,org_id) VALUES(0,1,7,6);

--增加团队
INSERT INTO kn_team (id,active,code,description,name,master_id) VALUES (1,'ENABLE','MOBILE','移动事业部大团队','移动事业部',2);
INSERT INTO kn_team (id,active,code,description,name,master_id) VALUES (2,'ENABLE','CRM','CRM团队','CRM',3);
INSERT INTO kn_team (id,active,code,description,name,master_id) VALUES (3,'ENABLE','ISP','ISP团队','ISP',4);
INSERT INTO kn_team (id,active,code,description,name,master_id) VALUES (4,'ENABLE','UCT','公共组件团队','公共组件',5);


--插入岗位
INSERT INTO kn_position (id,sup_id,code,name,path,depth,seq,active) VALUES (1,0,'KND','CEO','1.',1,1,'ENABLE');
INSERT INTO kn_position (id,sup_id,code,name,path,depth,seq,active) VALUES (2,1,'KND','CTO','1.2.',1,1,'ENABLE');
INSERT INTO kn_position (id,sup_id,code,name,path,depth,seq,active) VALUES (3,1,'KND','CIO','1.3.',1,1,'ENABLE');
INSERT INTO kn_position (id,sup_id,code,name,path,depth,seq,active) VALUES (4,1,'KND','CFO','1.4.',1,1,'ENABLE');
INSERT INTO kn_position (id,sup_id,code,name,path,depth,seq,active) VALUES (5,1,'KND','COO','1.5.',1,1,'ENABLE');


INSERT INTO KN_APPLICATION_INFO (id,TITLE,ENTITLE,ICON,FORFIRM,API_KEY,WORK_STATUS) VALUES (1,'诺德V5','knd_v5','',NULL,'cb28e312-df5c-4132-bd6a-da215d445934','usable');

--插入序列值
INSERT INTO KN_TABLE_SEQUNCE (SEQUENCE_NAME,SEQUENCE_NEXT_HI_VALUE) VALUES ('kn_user',1);
INSERT INTO KN_TABLE_SEQUNCE (SEQUENCE_NAME,SEQUENCE_NEXT_HI_VALUE) VALUES ('kn_role',1);
INSERT INTO KN_TABLE_SEQUNCE (SEQUENCE_NAME,SEQUENCE_NEXT_HI_VALUE) VALUES ('kn_resource',3);
