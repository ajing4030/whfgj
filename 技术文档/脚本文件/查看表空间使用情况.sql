-1、查看表空间的名称及大小 
SELECT t.tablespace_name, round(SUM(bytes / (1024 * 1024)), 0) ts_size 
FROM dba_tablespaces t, dba_data_files d 
WHERE t.tablespace_name = d.tablespace_name 
GROUP BY t.tablespace_name; 
--2、查看表空间物理文件的名称及大小 
SELECT tablespace_name, 
file_id, 
file_name, 
round(bytes / (1024 * 1024), 0) total_space 
FROM dba_data_files 
ORDER BY tablespace_name; 
--3、查看回滚段名称及大小 
SELECT segment_name, 
tablespace_name, 
r.status, 
(initial_extent / 1024) initialextent, 
(next_extent / 1024) nextextent, 
max_extents, 
v.curext curextent 
FROM dba_rollback_segs r, v$rollstat v 
WHERE r.segment_id = v.usn(+) 
ORDER BY segment_name; 
--4、查看控制文件 
SELECT NAME FROM v$controlfile; 
--5、查看日志文件 
SELECT MEMBER FROM v$logfile; 
--6、查看表空间的使用情况 
SELECT SUM(bytes) / (1024 * 1024) AS free_space, tablespace_name 
FROM dba_free_space 
GROUP BY tablespace_name; 
SELECT a.tablespace_name, 
a.bytes total, 
b.bytes used, 
c.bytes free, 
(b.bytes * 100) / a.bytes "% USED ", 
(c.bytes * 100) / a.bytes "% FREE " 
FROM sys.sm$ts_avail a, sys.sm$ts_used b, sys.sm$ts_free c 
WHERE a.tablespace_name = b.tablespace_name 
AND a.tablespace_name = c.tablespace_name; 
--7、查看数据库库对象 
SELECT owner, object_type, status, COUNT(*) count# 
FROM all_objects 
GROUP BY owner, object_type, status; 
--8、查看数据库的版本　 
SELECT version 
FROM product_component_version 
WHERE substr(product, 1, 6) = 'Oracle'; 
--9、查看数据库的创建日期和归档方式 
SELECT created, log_mode, log_mode FROM v$database; 
--1G=1024MB 
--1M=1024KB 
--1K=1024Bytes 
--1M=11048576Bytes 
--1G=1024*11048576Bytes=11313741824Bytes 
SELECT a.tablespace_name "表空间名", 
total "表空间大小", 
free "表空间剩余大小", 
(total - free) "表空间使用大小", 
total / (1024 * 1024 * 1024) "表空间大小(G)", 
free / (1024 * 1024 * 1024) "表空间剩余大小(G)", 
(total - free) / (1024 * 1024 * 1024) "表空间使用大小(G)", 
round((total - free) / total, 4) * 100 "使用率 %" 
FROM (SELECT tablespace_name, SUM(bytes) free 
FROM dba_free_space 
GROUP BY tablespace_name) a, 
(SELECT tablespace_name, SUM(bytes) total 
FROM dba_data_files 
GROUP BY tablespace_name) b 
WHERE a.tablespace_name = b.tablespace_name ;

select * from dba_directories;

---扩展表空间 sysaux system undotbs1 TRADEDB USERS 
  alter tablespace SYSTEM add datafile 'G:\APP\ADMINISTRATOR\ORADATA\WHFGJ\SYSTEM_01.dbf' resize 1024M;
  alter tablespace SYSAUX add datafile 'G:\APP\ADMINISTRATOR\ORADATA\WHFGJ\SYSAUX_01.dbf' resize 1024M;
  alter tablespace UNDOTBS1 add datafile 'G:\APP\ADMINISTRATOR\ORADATA\WHFGJ\UNDOTBS1_01.dbf' resize 1024M;
  alter tablespace TRADEDB add datafile 'G:\APP\ADMINISTRATOR\ORADATA\WHFGJ\TRADEDB_01.dbf' resize 1024M;
  alter tablespace USERS add datafile 'G:\APP\ADMINISTRATOR\ORADATA\WHFGJ\USERS_01.dbf' resize 1024M;
  
  --直接扩展数据文件
  alter database datafile '/opt/oracle/oradata/ora11g/system.dbf' resize 20G;
  alter tablespace system add datafile '/opt/oracle/oradata/ora11g/system2.dbf' size 10G autoextend off;
  alter database datafile '/opt/oracle/oradata/ora11g/system.dbf' autoextend on next 10M maxsize unlimited;
  
  SELECT T.TABLESPACE_NAME,D.FILE_NAME,D.AUTOEXTENSIBLE,D.BYTES,D.MAXBYTES/1024/1024/1024,D.STATUS 
FROM DBA_TABLESPACES T,DBA_DATA_FILES D 
WHERE T.TABLESPACE_NAME =D.TABLESPACE_NAME 
ORDER BY TABLESPACE_NAME,FILE_NAME; 

-----------锁表查询-------
select a.object_name,b.session_id,c.serial#,c.program,c.username,c.command,c.machine,c.lockwait
from all_objects a,v$locked_object b,v$session c where a.object_id=b.object_id and c.sid=b.session_id;


--解锁
alter system kill session'session_id,serial#';
--例句
alter system kill session'6,6655';
-----------查看连接数
select * from v$process;
select value from v$parameter where name = 'processes' --数据库允许的最大连接数

----修改最大连接数
alter system set processes=500 scope=spfile;
sql> shutdown immediate;
sql>startup;
