prompt PL/SQL Developer import file
prompt Created on 2019年6月6日 by HADES
set feedback off
set define off
prompt Creating MEMBER...
create table MEMBER
(
  id       VARCHAR2(32) default SYS_GUID() not null,
  name     VARCHAR2(20),
  nickname VARCHAR2(20),
  phonenum VARCHAR2(20),
  email    VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MEMBER
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating PRODUCT...
create table PRODUCT
(
  id            VARCHAR2(32) default SYS_GUID() not null,
  productnum    VARCHAR2(50) not null,
  productname   VARCHAR2(50),
  cityname      VARCHAR2(50),
  departuretime TIMESTAMP(6),
  productprice  NUMBER,
  productdesc   VARCHAR2(500),
  productstatus INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRODUCT
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRODUCT
  add constraint PRODUCT unique (ID, PRODUCTNUM)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ORDERS...
create table ORDERS
(
  id          VARCHAR2(32) default SYS_GUID() not null,
  ordernum    VARCHAR2(20) not null,
  ordertime   TIMESTAMP(6),
  peoplecount INTEGER,
  orderdesc   VARCHAR2(500),
  paytype     INTEGER,
  orderstatus INTEGER,
  productid   VARCHAR2(32),
  memberid    VARCHAR2(32)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDERS
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDERS
  add unique (ORDERNUM)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDERS
  add foreign key (PRODUCTID)
  references PRODUCT (ID);
alter table ORDERS
  add foreign key (MEMBERID)
  references MEMBER (ID);

prompt Creating TRAVELLER...
create table TRAVELLER
(
  id              VARCHAR2(32) default SYS_GUID() not null,
  name            VARCHAR2(20),
  sex             VARCHAR2(20),
  phonenum        VARCHAR2(20),
  credentialstype INTEGER,
  credentialsnum  VARCHAR2(50),
  travellertype   INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TRAVELLER
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ORDER_TRAVELLER...
create table ORDER_TRAVELLER
(
  orderid     VARCHAR2(32) not null,
  travellerid VARCHAR2(32) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDER_TRAVELLER
  add primary key (ORDERID, TRAVELLERID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDER_TRAVELLER
  add foreign key (ORDERID)
  references ORDERS (ID);
alter table ORDER_TRAVELLER
  add foreign key (TRAVELLERID)
  references TRAVELLER (ID);

prompt Creating PERMISSION...
create table PERMISSION
(
  id             VARCHAR2(32) default SYS_GUID() not null,
  permissionname VARCHAR2(50),
  url            VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PERMISSION
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating PERSISTENT_LOGINS...
create table PERSISTENT_LOGINS
(
  username  VARCHAR2(64),
  series    VARCHAR2(64),
  token     VARCHAR2(64),
  last_used TIMESTAMP(9) default CURRENT_TIMESTAMP
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ROLE...
create table ROLE
(
  id       VARCHAR2(32) default SYS_GUID() not null,
  rolename VARCHAR2(50),
  roledesc VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROLE
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ROLE_PERMISSION...
create table ROLE_PERMISSION
(
  permissionid VARCHAR2(32) not null,
  roleid       VARCHAR2(32) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROLE_PERMISSION
  add primary key (PERMISSIONID, ROLEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROLE_PERMISSION
  add foreign key (PERMISSIONID)
  references PERMISSION (ID);
alter table ROLE_PERMISSION
  add foreign key (ROLEID)
  references ROLE (ID);

prompt Creating SYSLOG...
create table SYSLOG
(
  id            VARCHAR2(32) default SYS_GUID() not null,
  visittime     TIMESTAMP(6),
  username      VARCHAR2(50),
  ip            VARCHAR2(30),
  url           VARCHAR2(50),
  executiontime INTEGER,
  method        VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SYSLOG
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating USERS...
create table USERS
(
  id       VARCHAR2(32) default SYS_GUID() not null,
  email    VARCHAR2(50) not null,
  username VARCHAR2(50),
  password VARCHAR2(80),
  phonenum VARCHAR2(20),
  status   INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table USERS
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table USERS
  add unique (EMAIL)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating USERS_ROLE...
create table USERS_ROLE
(
  userid VARCHAR2(32) not null,
  roleid VARCHAR2(32) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table USERS_ROLE
  add primary key (USERID, ROLEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table USERS_ROLE
  add foreign key (USERID)
  references USERS (ID);
alter table USERS_ROLE
  add foreign key (ROLEID)
  references ROLE (ID);

prompt Disabling triggers for MEMBER...
alter table MEMBER disable all triggers;
prompt Disabling triggers for PRODUCT...
alter table PRODUCT disable all triggers;
prompt Disabling triggers for ORDERS...
alter table ORDERS disable all triggers;
prompt Disabling triggers for TRAVELLER...
alter table TRAVELLER disable all triggers;
prompt Disabling triggers for ORDER_TRAVELLER...
alter table ORDER_TRAVELLER disable all triggers;
prompt Disabling triggers for PERMISSION...
alter table PERMISSION disable all triggers;
prompt Disabling triggers for PERSISTENT_LOGINS...
alter table PERSISTENT_LOGINS disable all triggers;
prompt Disabling triggers for ROLE...
alter table ROLE disable all triggers;
prompt Disabling triggers for ROLE_PERMISSION...
alter table ROLE_PERMISSION disable all triggers;
prompt Disabling triggers for SYSLOG...
alter table SYSLOG disable all triggers;
prompt Disabling triggers for USERS...
alter table USERS disable all triggers;
prompt Disabling triggers for USERS_ROLE...
alter table USERS_ROLE disable all triggers;
prompt Disabling foreign key constraints for ORDERS...
alter table ORDERS disable constraint SYS_C0011068;
alter table ORDERS disable constraint SYS_C0011069;
prompt Disabling foreign key constraints for ORDER_TRAVELLER...
alter table ORDER_TRAVELLER disable constraint SYS_C0011102;
alter table ORDER_TRAVELLER disable constraint SYS_C0011103;
prompt Disabling foreign key constraints for ROLE_PERMISSION...
alter table ROLE_PERMISSION disable constraint SYS_C0011062;
alter table ROLE_PERMISSION disable constraint SYS_C0011063;
prompt Disabling foreign key constraints for USERS_ROLE...
alter table USERS_ROLE disable constraint SYS_C0011058;
alter table USERS_ROLE disable constraint SYS_C0011059;
prompt Loading MEMBER...
insert into MEMBER (id, name, nickname, phonenum, email)
values ('E61D65F673D54F68B0861025C69773DB', '张三', '小三', '18888888888', 'zs@163.com');
commit;
prompt 1 records loaded
prompt Loading PRODUCT...
insert into PRODUCT (id, productnum, productname, cityname, departuretime, productprice, productdesc, productstatus)
values ('676C5BD1D35E429A8C2E114939C5685A', 'itcast-002', '北京三日游', '北京', to_timestamp('10-10-2018 10:10:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1200, '不错的旅行', 1);
insert into PRODUCT (id, productnum, productname, cityname, departuretime, productprice, productdesc, productstatus)
values ('12B7ABF2A4C544568B0A7C69F36BF8B7', 'itcast-003', '上海五日游', '上海', to_timestamp('25-04-2018 14:30:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1800, '魔都我来了', 0);
insert into PRODUCT (id, productnum, productname, cityname, departuretime, productprice, productdesc, productstatus)
values ('9F71F01CB448476DAFB309AA6DF9497F', 'itcast-001', '北京三日游', '北京', to_timestamp('10-10-2018 10:10:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1200, '不错的旅行', 1);
commit;
prompt 3 records loaded
prompt Loading ORDERS...
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('0E7231DC797C486290E8713CA3C6ECCC', '12345', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('5DC6A48DD4E94592AE904930EA866AFA', '54321', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('2FF351C4AC744E2092DCF08CFD314420', '67890', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('A0657832D93E4B10AE88A2D4B70B1A28', '98765', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('E4DD4C45EED84870ABA83574A801083E', '11111', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('96CC8BD43C734CC2ACBFF09501B4DD5D', '22222', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('55F9AF582D5A4DB28FB4EC3199385762', '33333', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('CA005CF1BE3C4EF68F88ABC7DF30E976', '44444', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('3081770BC3984EF092D9E99760FDABDE', '55555', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
commit;
prompt 9 records loaded
prompt Loading TRAVELLER...
insert into TRAVELLER (id, name, sex, phonenum, credentialstype, credentialsnum, travellertype)
values ('3FE27DF2A4E44A6DBC5D0FE4651D3D3E', '张龙', '男', '13333333333', 0, '123456789009876543', 0);
insert into TRAVELLER (id, name, sex, phonenum, credentialstype, credentialsnum, travellertype)
values ('EE7A71FB6945483FBF91543DBE851960', '张小龙', '男', '15555555555', 0, '987654321123456789', 1);
commit;
prompt 2 records loaded
prompt Loading ORDER_TRAVELLER...
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('0E7231DC797C486290E8713CA3C6ECCC', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('2FF351C4AC744E2092DCF08CFD314420', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('3081770BC3984EF092D9E99760FDABDE', 'EE7A71FB6945483FBF91543DBE851960');
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('55F9AF582D5A4DB28FB4EC3199385762', 'EE7A71FB6945483FBF91543DBE851960');
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('5DC6A48DD4E94592AE904930EA866AFA', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('96CC8BD43C734CC2ACBFF09501B4DD5D', 'EE7A71FB6945483FBF91543DBE851960');
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('A0657832D93E4B10AE88A2D4B70B1A28', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('CA005CF1BE3C4EF68F88ABC7DF30E976', 'EE7A71FB6945483FBF91543DBE851960');
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('E4DD4C45EED84870ABA83574A801083E', 'EE7A71FB6945483FBF91543DBE851960');
commit;
prompt 9 records loaded
prompt Loading PERMISSION...
insert into PERMISSION (id, permissionname, url)
values ('1629C68905E3472198A0AFB8C9B16C24', 'role findAll', '/role/findAll.do');
insert into PERMISSION (id, permissionname, url)
values ('65B2F8DF61B8450F8CC343FC1A65D67F', 'user findAll', '/user/findAll.do');
insert into PERMISSION (id, permissionname, url)
values ('F6B90102EBDA4B17B622CA55877406AA', 'user findById', '/user/findById.do');
commit;
prompt 3 records loaded
prompt Loading PERSISTENT_LOGINS...
prompt Table is empty
prompt Loading ROLE...
insert into ROLE (id, rolename, roledesc)
values ('78B531058CC44C7187C3CFF91FE8CABF', 'guest', '宾客');
insert into ROLE (id, rolename, roledesc)
values ('1111', 'ADMIN', 'VIP');
insert into ROLE (id, rolename, roledesc)
values ('2222', 'USER', 'USER');
commit;
prompt 3 records loaded
prompt Loading ROLE_PERMISSION...
insert into ROLE_PERMISSION (permissionid, roleid)
values ('1629C68905E3472198A0AFB8C9B16C24', '78B531058CC44C7187C3CFF91FE8CABF');
insert into ROLE_PERMISSION (permissionid, roleid)
values ('65B2F8DF61B8450F8CC343FC1A65D67F', '1111');
insert into ROLE_PERMISSION (permissionid, roleid)
values ('65B2F8DF61B8450F8CC343FC1A65D67F', '2222');
insert into ROLE_PERMISSION (permissionid, roleid)
values ('65B2F8DF61B8450F8CC343FC1A65D67F', '78B531058CC44C7187C3CFF91FE8CABF');
insert into ROLE_PERMISSION (permissionid, roleid)
values ('F6B90102EBDA4B17B622CA55877406AA', '1111');
insert into ROLE_PERMISSION (permissionid, roleid)
values ('F6B90102EBDA4B17B622CA55877406AA', '2222');
commit;
prompt 6 records loaded
prompt Loading SYSLOG...
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('DECF0B257E46487192C7A4EAC5CCCC06', to_timestamp('06-06-2019 10:57:51.765000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 22, '[类名]com.itheima.controller.PermissionController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('ACD44F56DC484CC8B24064CEDE7E1390', to_timestamp('06-06-2019 10:57:59.657000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 5, '[类名]com.itheima.controller.PermissionController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('431579DFB07247A3B584B98ED366E92B', to_timestamp('06-06-2019 10:58:21.262000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/permission/save.do', 5, '[类名]com.itheima.controller.PermissionController [方法名]save');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('A98F4D04919242C297593179796D95E9', to_timestamp('06-06-2019 10:58:21.322000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 4, '[类名]com.itheima.controller.PermissionController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('1A4273BA6FCA4DD39653160DDFB6CAA0', to_timestamp('06-06-2019 11:09:55.495000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 15, '[类名]com.itheima.controller.RoleController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('578DD7D96A58442995EA98D4C846100F', to_timestamp('06-06-2019 11:10:18.621000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/findAll.do', 13, '[类名]com.itheima.controller.UserController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('7872AE7442474867B06DDE275987C6BE', to_timestamp('06-06-2019 11:11:25.650000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 14, '[类名]com.itheima.controller.UserController [方法名]findUserByIdAndAllRole');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('C706F78F8D1A4BC7BAA6B5ED8B76C1C6', to_timestamp('06-06-2019 11:11:30.581000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/findAll.do', 3, '[类名]com.itheima.controller.UserController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('2D890C0645824340907EDC35292F2388', to_timestamp('06-06-2019 11:11:37.354000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.itheima.controller.UserController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('409776FD7A9E4B4F8B70CF533A6C938B', to_timestamp('06-06-2019 11:14:09.161000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/save.do', 205, '[类名]com.itheima.controller.UserController [方法名]save');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('D342B7E2C2B24908AE393562E4754247', to_timestamp('06-06-2019 11:14:09.379000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/findAll.do', 3, '[类名]com.itheima.controller.UserController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('953F98028C3143CC8355823A953BD313', to_timestamp('06-06-2019 11:14:29.068000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 6, '[类名]com.itheima.controller.UserController [方法名]findUserByIdAndAllRole');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('BBBBE2C261DC4AF39F318C192C7E38B8', to_timestamp('06-06-2019 11:14:36.259000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/addRoleToUser.do', 9, '[类名]com.itheima.controller.UserController [方法名]addRoleToUser');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('8DD0FBF4097E4301B55C99208F1F276A', to_timestamp('06-06-2019 11:14:36.279000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名]com.itheima.controller.UserController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('A276404494114F269DAACE59B4080481', to_timestamp('06-06-2019 11:14:38.465000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/userfindById.do', 8, '[类名]com.itheima.controller.UserController [方法名]findById');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('8BE02FE22D354F4A923208D676B62060', to_timestamp('06-06-2019 11:16:20.022000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/findAll.do', 2, '[类名]com.itheima.controller.UserController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('2EBD7466B5CA4F32A981E586DF843F2E', to_timestamp('06-06-2019 11:16:40.932000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/userfindById.do', 9, '[类名]com.itheima.controller.UserController [方法名]findById');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('507E4C53816C45C5819EB0C77DEB5B88', to_timestamp('06-06-2019 11:17:27.218000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/userfindById.do', 8, '[类名]com.itheima.controller.UserController [方法名]findById');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('D367C77450D7494D9EA80C9DE33557E7', to_timestamp('06-06-2019 11:18:55.971000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/userfindById.do', 10, '[类名]com.itheima.controller.UserController [方法名]findById');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('E2E66049593A4F12BB3214ACA0E05C67', to_timestamp('06-06-2019 11:19:06.565000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名]com.itheima.controller.UserController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('06B7461488B24294B76548FBA7438EDD', to_timestamp('06-06-2019 11:36:28.187000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 5, '[类名]com.itheima.controller.PermissionController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('3B412CD648DA462595FDDA24AFAAAFB4', to_timestamp('06-06-2019 11:36:33.094000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 3, '[类名]com.itheima.controller.RoleController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('7E3DC70F68F94D619176E15B02E9B9F2', to_timestamp('06-06-2019 11:36:36.934000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/role/findById.do', 43, '[类名]com.itheima.controller.RoleController [方法名]findById');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('27F27E2831364DE880A7945C41540985', to_timestamp('06-06-2019 11:36:40.631000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 3, '[类名]com.itheima.controller.RoleController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('F5A90F906E794F589EAF1DBBBD888519', to_timestamp('06-06-2019 11:36:42.225000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/role/findById.do', 5, '[类名]com.itheima.controller.RoleController [方法名]findById');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('CF8A46DDF158451BA58F221CCB63174D', to_timestamp('06-06-2019 11:36:46.047000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 3, '[类名]com.itheima.controller.RoleController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('D4CF5514CE434F40A3F79F149DF77917', to_timestamp('06-06-2019 11:36:47.924000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission.do', 9, '[类名]com.itheima.controller.RoleController [方法名]findRoleByIdAndAllPermission');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('B13248610D7340FB9CF610EEBE6E19DB', to_timestamp('06-06-2019 11:36:53.888000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/role/addPermissionToRole.do', 20, '[类名]com.itheima.controller.RoleController [方法名]addPermissionToRole');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('F81C8728FABB4945A9A3018028935CA9', to_timestamp('06-06-2019 11:36:53.920000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 3, '[类名]com.itheima.controller.RoleController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('B1E7685A684440B38616A3E3BDF8C297', to_timestamp('06-06-2019 11:36:55.978000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/role/findById.do', 6, '[类名]com.itheima.controller.RoleController [方法名]findById');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('6571298B2B124FDAA591766C703F0744', to_timestamp('06-06-2019 11:37:35.224000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/role/findById.do', 7, '[类名]com.itheima.controller.RoleController [方法名]findById');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('5FA76D42FF2E49FEAE85BD5C0ED62951', to_timestamp('06-06-2019 11:37:51.795000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/role/findById.do', 7, '[类名]com.itheima.controller.RoleController [方法名]findById');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('3B222232D89A47B8B0ECFB42CDAEE8FD', to_timestamp('06-06-2019 15:12:41.905000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名]com.itheima.controller.UserController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('6D2F8E8BBB64490287E50419E9B31388', to_timestamp('06-06-2019 15:12:44.665000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/userfindById.do', 7, '[类名]com.itheima.controller.UserController [方法名]findById');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('E588C99D33E443BE8E207CC9B12FAA5A', to_timestamp('06-06-2019 16:53:54.752000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'mary', '0:0:0:0:0:0:0:1', '/product/findAll.do', 30, '[类名]com.itheima.controller.ProductController [方法名]finAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('372D6ABDC9174260B828575802EBBB49', to_timestamp('06-06-2019 16:54:14.530000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'mary', '0:0:0:0:0:0:0:1', '/product/findAll.do', 3, '[类名]com.itheima.controller.ProductController [方法名]finAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('610F657041E04474813BA22C34086ABF', to_timestamp('06-06-2019 17:26:52.080000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/findAll.do', 3, '[类名]com.itheima.controller.UserController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('AEEC365254184A8497827BFA57DD28DE', to_timestamp('06-06-2019 17:27:14.103000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/save.do', 124, '[类名]com.itheima.controller.UserController [方法名]save');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('F9314DE749554A7FA46BFE4A154BF4B8', to_timestamp('06-06-2019 17:27:14.244000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/findAll.do', 3, '[类名]com.itheima.controller.UserController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('DA8E8D489F864503A7BF11AC4BB0333C', to_timestamp('06-06-2019 17:27:19.209000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/userfindById.do', 8, '[类名]com.itheima.controller.UserController [方法名]findById');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('31F88C3FFA004EEF9FA693E71861E7ED', to_timestamp('06-06-2019 17:28:34.716000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名]com.itheima.controller.UserController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('E7A4FB44B54545AEA4F0DE91AC2EAEC8', to_timestamp('06-06-2019 17:28:37.232000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 6, '[类名]com.itheima.controller.UserController [方法名]findUserByIdAndAllRole');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('9E794B3A46834ECE81E95C50FA5E98B3', to_timestamp('06-06-2019 17:28:40.327000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/addRoleToUser.do', 4, '[类名]com.itheima.controller.UserController [方法名]addRoleToUser');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('9A885E3B301E49D2BE66CB3FAF7F23B1', to_timestamp('06-06-2019 17:28:40.345000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名]com.itheima.controller.UserController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('64C78EC43A124A48871D67372F195A7C', to_timestamp('06-06-2019 17:28:45.688000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/userfindById.do', 8, '[类名]com.itheima.controller.UserController [方法名]findById');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('A22F2FF1D2524258A18C81F022823DDC', to_timestamp('06-06-2019 17:28:49.678000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/findAll.do', 2, '[类名]com.itheima.controller.UserController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('410860EDB58240B8B85ACB4C24701696', to_timestamp('05-06-2019 23:54:19.647000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 15, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('A808409126A44F3EAF5129F8569056AA', to_timestamp('05-06-2019 23:54:29.730000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 11, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('0C92617B1B7941A582CEA3CC39778F64', to_timestamp('05-06-2019 23:56:41.189000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('0BBF44F9C4114C50AD774C77136F131E', to_timestamp('05-06-2019 23:56:47.131000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 5, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('AE76CA28CA8846159E80D0C61A2EDA3C', to_timestamp('05-06-2019 23:56:49.192000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 5, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('3534FB3603B04B8C9B35878EB746D04B', to_timestamp('05-06-2019 23:56:51.403000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('DB2086BC54304186A05B55EE3E30D32A', to_timestamp('05-06-2019 23:57:58.751000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('0F8E96CD81EC417C9745272F092D0979', to_timestamp('05-06-2019 23:58:50.150000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 10, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('8B0A93B04FFE4522853D6DE41910C76B', to_timestamp('05-06-2019 23:59:00.703000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('5E57B0A4E1494F3F877370CCBEE31634', to_timestamp('05-06-2019 23:59:07.660000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('1EE47F38D8FD487D8161CC8E0CB9835C', to_timestamp('06-06-2019 00:01:48.472000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('5815B24C5F6D49D7ADAEF64D3D5DC71F', to_timestamp('06-06-2019 00:02:00.473000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('B8141E01D6F54611BDB3A517DAF3711E', to_timestamp('06-06-2019 00:02:05.110000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('275B8BEABB7943588E9B7126A26EAF56', to_timestamp('06-06-2019 00:02:24.915000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('EA05140C7AFF4E29BE802658375C9A6E', to_timestamp('06-06-2019 00:02:32.343000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('B70187C4ECB5459A8F34D5AE1F8A4E70', to_timestamp('06-06-2019 00:06:43.641000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('03683D4D6D4A42FE8958082A085EFFA9', to_timestamp('06-06-2019 00:08:22.083000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('819CDE1B997F4C9DB531BB1263B62E96', to_timestamp('06-06-2019 00:08:32.150000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('DE676876F7B9480392ACE8B6453E5CA4', to_timestamp('06-06-2019 00:08:40.793000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('24C6BD2FF299424397EA32EA6782EBBC', to_timestamp('06-06-2019 00:08:44.196000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 10, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('D62E68018C4F4420A8256454434F2A10', to_timestamp('06-06-2019 00:08:49.529000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('9387C4E157B04BF89B83F9BAC0B6ECC0', to_timestamp('06-06-2019 00:09:07.012000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 15, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('98DB734C3C324BB08165874D9AFB5A74', to_timestamp('06-06-2019 00:09:12.274000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('3BCD7E0F73B64D6BAA1F8E6BD1805CA0', to_timestamp('06-06-2019 00:09:14.970000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('2EF78BD6516849378DC6E36AA2CE5D32', to_timestamp('06-06-2019 00:18:54.088000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 12, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('7426EB7068BA4AE19FE8F9675A552DB9', to_timestamp('06-06-2019 17:28:52.256000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/userfindById.do', 7, '[类名]com.itheima.controller.UserController [方法名]findById');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('0ECB9B212E474A85AC5A003C280C1575', to_timestamp('05-06-2019 22:45:24.061000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/findAll.do', 3, '[类名]com.itheima.controller.UserController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('D83B487B25ED40E48A956158DF32145C', to_timestamp('05-06-2019 22:46:06.439000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 17, '[类名]com.itheima.controller.PermissionController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('0E7E4904C8DA489FBBA2C52D4F4DEF65', to_timestamp('05-06-2019 22:46:10.008000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 14, '[类名]com.itheima.controller.RoleController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('D44006BAF8EA46988166D25FECD4B825', to_timestamp('05-06-2019 22:46:19.609000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/findAll.do', 2, '[类名]com.itheima.controller.UserController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('9769BF4DD9AC455B85850B2F46F7446A', to_timestamp('05-06-2019 22:46:22.221000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/userfindById.do', 6, '[类名]com.itheima.controller.UserController [方法名]findById');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('8360BDFD5E424BFA894D9056E66E442B', to_timestamp('05-06-2019 22:46:29.756000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 4, '[类名]com.itheima.controller.PermissionController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('512992297DDE4DBAAE5F070AF48727AC', to_timestamp('05-06-2019 22:46:40.524000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 2, '[类名]com.itheima.controller.PermissionController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('79DFE22181A34878BBA2043B55589947', to_timestamp('05-06-2019 22:46:57.544000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/product/findAll.do', 13, '[类名]com.itheima.controller.ProductController [方法名]finAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('B91521AA4B96476D8EAE20CCD86D0E43', to_timestamp('05-06-2019 22:47:02.326000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 120, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('28FAABEDAADD4911B4C380DBAEDDAA4D', to_timestamp('05-06-2019 22:47:06.577000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 13, '[类名]com.itheima.controller.SysLogController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('4D6416EDAC2F4C939E4CDCC7FED06F87', to_timestamp('05-06-2019 23:24:39.979000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/findAll.do', 3, '[类名]com.itheima.controller.UserController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('F980CF2E41724C548B6D3D3380982D07', to_timestamp('05-06-2019 23:24:42.688000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/userfindById.do', 8, '[类名]com.itheima.controller.UserController [方法名]findById');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('CE991820689B4751A774875EEC533DF1', to_timestamp('05-06-2019 23:25:31.517000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/findAll.do', 3, '[类名]com.itheima.controller.UserController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('241F0365B50549F49B515D8D600134E1', to_timestamp('05-06-2019 23:25:33.725000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/userfindById.do', 6, '[类名]com.itheima.controller.UserController [方法名]findById');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('1AB6344161014DA38304DD73A049CEFD', to_timestamp('05-06-2019 23:35:16.393000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 3, '[类名]com.itheima.controller.RoleController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('E355AFBD980042899EE02ED427E5CFD2', to_timestamp('05-06-2019 23:47:19.314000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.itheima.controller.RoleController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('F9A578D2E3DD4DF380777E9442126631', to_timestamp('05-06-2019 23:47:38.256000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/role/save.do', 10, '[类名]com.itheima.controller.RoleController [方法名]save');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('9654C381EE6D411891C0197CB9233BFE', to_timestamp('05-06-2019 23:47:38.396000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.itheima.controller.RoleController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('C0368A8F1EEF46ED88AA5F86DF4C2B6A', to_timestamp('05-06-2019 23:51:04.826000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/product/findAll.do', 3, '[类名]com.itheima.controller.ProductController [方法名]finAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('1787B20DCD2142E0A87576DEF50D8CFB', to_timestamp('05-06-2019 23:53:29.878000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 11, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('D76D0D489F844BEF9C8F6B913BB68B62', to_timestamp('05-06-2019 23:53:41.166000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 11, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('7DB4D3A4E29343C2B31BDBB921B3FF5B', to_timestamp('05-06-2019 23:53:42.456000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 5, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('BFB4B8EC590444F7BDB72A146D837DF6', to_timestamp('05-06-2019 23:53:46.572000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 10, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('14DB1F77DDC7415EA63764CF7C321A8B', to_timestamp('05-06-2019 23:54:24.288000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 108, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('2143761796DC42559209970F748DFA1A', to_timestamp('05-06-2019 23:54:27.742000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('8246CB65A12D4C249A70673FED3A11D1', to_timestamp('05-06-2019 23:54:31.694000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 11, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('AEA39D366C0349A6ADA51AE7DD4BAA56', to_timestamp('05-06-2019 23:54:52.180000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('EB0BDEAA5DC8466DB749E6D2BD205E11', to_timestamp('05-06-2019 23:56:22.753000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrderController [方法名]findAll');
commit;
prompt 100 records committed...
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('44AB798066FB47AE966CB2A112DD8499', to_timestamp('05-06-2019 23:56:36.823000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('594D9A3E0BDE4335AC347FD4EE07B3B8', to_timestamp('06-06-2019 00:08:35.043000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('B11289AA41154C19B3DB9D6A931FCF48', to_timestamp('06-06-2019 00:09:18.511000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('59611C82D12C485EB61223DB52891C9A', to_timestamp('06-06-2019 00:14:48.863000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('645674D34003459A96413A52024DC6D2', to_timestamp('06-06-2019 00:18:51.615000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 10, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('8F950B44B17E4F9BA1955F7B0F26DDF4', to_timestamp('06-06-2019 00:19:16.312000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('F3F89E0DC82F47418096F30372E35B61', to_timestamp('06-06-2019 17:29:00.548000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/findAll.do', 3, '[类名]com.itheima.controller.UserController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('63993A2DD5F64161874401094EDD9980', to_timestamp('06-06-2019 17:29:03.300000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.itheima.controller.RoleController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('957A992955CE49D9B78AADC934DCBC54', to_timestamp('06-06-2019 17:29:05.362000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 97, '[类名]com.itheima.controller.PermissionController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('198A1D4C43494FC29DFB15626D6811E4', to_timestamp('06-06-2019 17:50:52.514000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 168, '[类名]com.itheima.controller.OrderController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('078FBF1217124A0892E0C08A5BA880BB', to_timestamp('06-06-2019 17:50:56.826000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.itheima.controller.RoleController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('20A25D0928EE42918B2F63D4741DF686', to_timestamp('06-06-2019 17:51:01.270000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/role/findById.do', 6, '[类名]com.itheima.controller.RoleController [方法名]findById');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('2FB9E979656F4CDFA3DE71EA2E0084B9', to_timestamp('06-06-2019 17:51:05.395000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 3, '[类名]com.itheima.controller.RoleController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('F372599C10884AE9B6115DDA0D5C33B9', to_timestamp('06-06-2019 17:51:07.901000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission.do', 8, '[类名]com.itheima.controller.RoleController [方法名]findRoleByIdAndAllPermission');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('76DEC762E1624984B18EAD9741261038', to_timestamp('06-06-2019 17:51:10.848000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.itheima.controller.RoleController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('A7B0F919308B4D73A484921AAAF68F2B', to_timestamp('06-06-2019 17:51:17.336000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名]com.itheima.controller.UserController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('FE258EA435CD41D9975B4B1DAC17B826', to_timestamp('06-06-2019 17:51:20.992000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 8, '[类名]com.itheima.controller.UserController [方法名]findUserByIdAndAllRole');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('F4B04B2E08304F099B87E9A45BCE3E26', to_timestamp('06-06-2019 17:51:24.842000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/addRoleToUser.do', 8, '[类名]com.itheima.controller.UserController [方法名]addRoleToUser');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('36ABE4033DED4C0E9EAD5BD19DEFB2F6', to_timestamp('06-06-2019 17:51:24.864000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jack', '0:0:0:0:0:0:0:1', '/user/findAll.do', 3, '[类名]com.itheima.controller.UserController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('C713D3A2024E44659DB28C3B160B7643', to_timestamp('06-06-2019 17:51:36.060000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.itheima.controller.RoleController [方法名]findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('6F7B99EFB8A34EF9BE8E2279AD1D14F1', to_timestamp('06-06-2019 17:52:06.310000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'tom', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 33, '[类名]com.itheima.controller.SysLogController [方法名]findAll');
commit;
prompt 121 records loaded
prompt Loading USERS...
insert into USERS (id, email, username, password, phonenum, status)
values ('84E15262F5DF47D39D10F92963A055D8', '123456@qq.com', 'mary', '$2a$10$cMUybdJGy1hn3ZF2OtPssuJttIwepo6Ey63cR4.10THzTR/yB2ZNa', '13555555555', 1);
insert into USERS (id, email, username, password, phonenum, status)
values ('7E9FBD520D494610B45B32C2C99879E1', 'jidda@qq.com', 'tom', '$2a$10$YwPv.YnQ6nP8aG0Ip1PMseIwCQFcFEEy77Q4CCBIdQXiaMek0RGlC', '15333333333', 1);
insert into USERS (id, email, username, password, phonenum, status)
values ('341FAC0B62D4484FA4C468C53AA05020', '1245454@qq.com', 'jack', '$2a$10$lFZ6i26cHbsZh1dAt5g7guNRYIVsEa3TGpuUTna3qaKfNREiRiG3u', '13333333333', 1);
commit;
prompt 3 records loaded
prompt Loading USERS_ROLE...
insert into USERS_ROLE (userid, roleid)
values ('341FAC0B62D4484FA4C468C53AA05020', '1111');
insert into USERS_ROLE (userid, roleid)
values ('341FAC0B62D4484FA4C468C53AA05020', '2222');
insert into USERS_ROLE (userid, roleid)
values ('7E9FBD520D494610B45B32C2C99879E1', '2222');
insert into USERS_ROLE (userid, roleid)
values ('7E9FBD520D494610B45B32C2C99879E1', '78B531058CC44C7187C3CFF91FE8CABF');
insert into USERS_ROLE (userid, roleid)
values ('84E15262F5DF47D39D10F92963A055D8', '2222');
insert into USERS_ROLE (userid, roleid)
values ('84E15262F5DF47D39D10F92963A055D8', '78B531058CC44C7187C3CFF91FE8CABF');
commit;
prompt 6 records loaded
prompt Enabling foreign key constraints for ORDERS...
alter table ORDERS enable constraint SYS_C0011068;
alter table ORDERS enable constraint SYS_C0011069;
prompt Enabling foreign key constraints for ORDER_TRAVELLER...
alter table ORDER_TRAVELLER enable constraint SYS_C0011102;
alter table ORDER_TRAVELLER enable constraint SYS_C0011103;
prompt Enabling foreign key constraints for ROLE_PERMISSION...
alter table ROLE_PERMISSION enable constraint SYS_C0011062;
alter table ROLE_PERMISSION enable constraint SYS_C0011063;
prompt Enabling foreign key constraints for USERS_ROLE...
alter table USERS_ROLE enable constraint SYS_C0011058;
alter table USERS_ROLE enable constraint SYS_C0011059;
prompt Enabling triggers for MEMBER...
alter table MEMBER enable all triggers;
prompt Enabling triggers for PRODUCT...
alter table PRODUCT enable all triggers;
prompt Enabling triggers for ORDERS...
alter table ORDERS enable all triggers;
prompt Enabling triggers for TRAVELLER...
alter table TRAVELLER enable all triggers;
prompt Enabling triggers for ORDER_TRAVELLER...
alter table ORDER_TRAVELLER enable all triggers;
prompt Enabling triggers for PERMISSION...
alter table PERMISSION enable all triggers;
prompt Enabling triggers for PERSISTENT_LOGINS...
alter table PERSISTENT_LOGINS enable all triggers;
prompt Enabling triggers for ROLE...
alter table ROLE enable all triggers;
prompt Enabling triggers for ROLE_PERMISSION...
alter table ROLE_PERMISSION enable all triggers;
prompt Enabling triggers for SYSLOG...
alter table SYSLOG enable all triggers;
prompt Enabling triggers for USERS...
alter table USERS enable all triggers;
prompt Enabling triggers for USERS_ROLE...
alter table USERS_ROLE enable all triggers;
set feedback on
set define on
prompt Done.
