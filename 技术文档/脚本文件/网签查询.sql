--ѡ���ң���
select nvl(a.hsms,'��') as hsms ,nvl(a.hszl,'��')as hszl,nvl(a.myc,'��')as myc,
nvl(a.jzmj,0)as jzmj,nvl(a.fwyt,'��')as fwyt, a.lphs_lsh,a.xxlx,a.STATE16,b.XSZT,b.xslx from registration.Lphs a 
left join REGISTRATION.presellpermissiondetail b on a.lphs_lsh = b.fwlsh where a.state9 != 1 and a.djzt = 2 
AND not exists ( select b.fwlsh from REGISTRATION.presellpermissiondetail b where a.lphs_lsh = b.fwlsh ) 
 and a.lpz_lsh=2019000411 and a.xxlx=1
--------�༭����
select t.*, nvl(l.hsms,'��') as hsms ,nvl(l.hszl,'��')as hszl,nvl(l.myc,'��')as myc, nvl(l.jzmj,0)as jzmj,
nvl(l.fwyt,'��')as fwyt, l.lphs_lsh,l.xxlx,l.STATE16 from 
REGISTRATION.PRESELLPERMISSIONDETAIL t join REGISTRATION.Lphs l 
on t.fwlsh = l.lphs_lsh where t.ysxklsh = 20190032

-------Ԥ��֤�б��ѯ

select b.lpzlsh,b.lpzl,b.jzzmj,b.ghyt,b.zcs,a.ysxkz_no,a.cqzh,e.name,c.project_name,a.yszjzmj,a.ysxklsh
                    from registration.presellpermission a
                    join registration.lpz b on a.zlsh = b.LPZLSH
                    join registration.realtyproject c on b.project_id=c.project_id
                    join registration.project_practitioners d on c.project_id = d.project_id
                    join registration.subject e on d.ztid=e.ztid;
----------Ԥ�����֤��ͨ
select e.name,e.ztid,b.lpzh,b.jzjg,b.fwlx,b.ghyt,b.lpzl,b.jzzmj,b.lpzlsh,c.project_name
                        from registration.lpz b
                        join registration.realtyproject c on b.project_id=c.project_id
                        join registration.project_practitioners d on c.project_id = d.project_id
                        join registration.subject e on d.ztid=e.ztid
                        join YS.account_case a on a.zlsh =b.lpzlsh
                        join YS.ACCOUNT ac on ac.id = a.id
                        where  1=1                        
                        and a.state = 2
                        and ac.state = 1
                        and  e.name like '%0403%'
                        and not exists (select 1
                                        from registration.presellpermission t
                                       where t.sfxs = 1
                                         and t.cqzh is not null
                                         and b.lpzlsh = t.zlsh);

                   
                    select * from registration.presellpermission a where a.ysxklsh=20190049 or a.xmmc ='������ҵ0403' ;
                    select * from registration.presellpermissiondetail;
                    select * from ys.permit a where a.subject_name like '%0403%';
                    
