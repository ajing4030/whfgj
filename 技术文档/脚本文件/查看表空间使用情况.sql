-1���鿴��ռ�����Ƽ���С 
SELECT t.tablespace_name, round(SUM(bytes / (1024 * 1024)), 0) ts_size 
FROM dba_tablespaces t, dba_data_files d 
WHERE t.tablespace_name = d.tablespace_name 
GROUP BY t.tablespace_name; 
--2���鿴��ռ������ļ������Ƽ���С 
SELECT tablespace_name, 
file_id, 
file_name, 
round(bytes / (1024 * 1024), 0) total_space 
FROM dba_data_files 
ORDER BY tablespace_name; 
--3���鿴�ع������Ƽ���С 
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
--4���鿴�����ļ� 
SELECT NAME FROM v$controlfile; 
--5���鿴��־�ļ� 
SELECT MEMBER FROM v$logfile; 
--6���鿴��ռ��ʹ����� 
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
--7���鿴���ݿ����� 
SELECT owner, object_type, status, COUNT(*) count# 
FROM all_objects 
GROUP BY owner, object_type, status; 
--8���鿴���ݿ�İ汾�� 
SELECT version 
FROM product_component_version 
WHERE substr(product, 1, 6) = 'Oracle'; 
--9���鿴���ݿ�Ĵ������ں͹鵵��ʽ 
SELECT created, log_mode, log_mode FROM v$database; 
--1G=1024MB 
--1M=1024KB 
--1K=1024Bytes 
--1M=11048576Bytes 
--1G=1024*11048576Bytes=11313741824Bytes 
SELECT a.tablespace_name "��ռ���", 
total "��ռ��С", 
free "��ռ�ʣ���С", 
(total - free) "��ռ�ʹ�ô�С", 
total / (1024 * 1024 * 1024) "��ռ��С(G)", 
free / (1024 * 1024 * 1024) "��ռ�ʣ���С(G)", 
(total - free) / (1024 * 1024 * 1024) "��ռ�ʹ�ô�С(G)", 
round((total - free) / total, 4) * 100 "ʹ���� %" 
FROM (SELECT tablespace_name, SUM(bytes) free 
FROM dba_free_space 
GROUP BY tablespace_name) a, 
(SELECT tablespace_name, SUM(bytes) total 
FROM dba_data_files 
GROUP BY tablespace_name) b 
WHERE a.tablespace_name = b.tablespace_name ;

select * from dba_directories;

---��չ��ռ� sysaux system undotbs1 TRADEDB USERS 
  alter tablespace SYSTEM add datafile 'G:\APP\ADMINISTRATOR\ORADATA\WHFGJ\SYSTEM_01.dbf' resize 1024M;
  alter tablespace SYSAUX add datafile 'G:\APP\ADMINISTRATOR\ORADATA\WHFGJ\SYSAUX_01.dbf' resize 1024M;
  alter tablespace UNDOTBS1 add datafile 'G:\APP\ADMINISTRATOR\ORADATA\WHFGJ\UNDOTBS1_01.dbf' resize 1024M;
  alter tablespace TRADEDB add datafile 'G:\APP\ADMINISTRATOR\ORADATA\WHFGJ\TRADEDB_01.dbf' resize 1024M;
  alter tablespace USERS add datafile 'G:\APP\ADMINISTRATOR\ORADATA\WHFGJ\USERS_01.dbf' resize 1024M;
  
  --ֱ����չ�����ļ�
  alter database datafile '/opt/oracle/oradata/ora11g/system.dbf' resize 20G;
  alter tablespace system add datafile '/opt/oracle/oradata/ora11g/system2.dbf' size 10G autoextend off;
  alter database datafile '/opt/oracle/oradata/ora11g/system.dbf' autoextend on next 10M maxsize unlimited;
  
  SELECT T.TABLESPACE_NAME,D.FILE_NAME,D.AUTOEXTENSIBLE,D.BYTES,D.MAXBYTES/1024/1024/1024,D.STATUS 
FROM DBA_TABLESPACES T,DBA_DATA_FILES D 
WHERE T.TABLESPACE_NAME =D.TABLESPACE_NAME 
ORDER BY TABLESPACE_NAME,FILE_NAME; 

-----------�����ѯ-------
select a.object_name,b.session_id,c.serial#,c.program,c.username,c.command,c.machine,c.lockwait
from all_objects a,v$locked_object b,v$session c where a.object_id=b.object_id and c.sid=b.session_id;


--����
alter system kill session'session_id,serial#';
--����
alter system kill session'6,6655';
-----------�鿴������
select * from v$process;
select value from v$parameter where name = 'processes' --���ݿ���������������

----�޸����������
alter system set processes=500 scope=spfile;
sql> shutdown immediate;
sql>startup;
