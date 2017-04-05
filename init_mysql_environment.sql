drop database if exists isdsp_dev; 
create database isdsp_dev;
grant all privileges on isdsp_dev.* to "isdsp"@"%" identified by "12345678";
drop database if exists isdsp_test; 
create database isdsp_test;
grant all privileges on isdsp_test.* to "isdsp"@"%" identified by "12345678";
drop database if exists isdsp_production; 
create database isdsp_production;
grant all privileges on isdsp_production.* to "isdsp"@"%" identified by "12345678";
flush privileges;

