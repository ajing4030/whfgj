select (select count(0) from registration.contractnew b
             join registration.lpz lpz   on b.lpzlsh = lpz.lpzlsh   join registration.realtyproject rea
             on rea.project_id = lpz.project_id where nvl(b.Cancle_State, 0) = 0
             and (instr(b.a36 , '住宅') > 0 or instr(b.a35  , '住宅') > 0 )
             and rea.project_id =  2010000019  and b.status='035,009'
             and instr(b.a23,'310098199010121111')>0) zhu ,
             (select count(0)  from registration.contractnew b
             join registration.lpz lpz  on b.lpzlsh = lpz.lpzlsh
             join registration.realtyproject rea on rea.project_id = lpz.project_id
             where nvl(b.Cancle_State, 0) = 0
             and (instr(b.a36 , '车') > 0 or instr(b.a35  , '车') > 0 )
              and b.status='035,009' and rea.project_id =  2010000019
             and instr(b.a23,'310098199010121111')>0) che  from dual;
             
             
             select t.*,rowid from registration.contractnew t  
             
             where   t.a23 like '%310098199010121111%'  ;
             
             select t.*,rowid from registration.contractnew t where t.htbh='201910001276'  ;
             
          select t.*,rowid from registration.lphs t  where t.lphs_lsh=2019031629;
     select t.*,rowid from registration
              select l.project_id,t.* from registration.lphs t join registration.lpz  l on l.lpzlsh=t.lpz_lsh
               where t.lphs_lsh=2019034667;
 select t.*,rowid from registration.esf_info t where t.msr='王雪飞' and t.lphs_lsh=201910001276;
 select t.*,rowid from registration.certificate t where t.zjhm='201900003280';
  select t.*,rowid from registration.subject t where t.ztid=201900003282 or t.name='王雪飞';
  
    select t.*,rowid from registration.lpz t where t.lpzl='青岛中路-78号'
