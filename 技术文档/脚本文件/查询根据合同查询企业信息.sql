--查询根据合同查询企业信息
 select  a.* from  registration.contractnew  f   join   registration.lpz c on f.lpzlsh = c.lpzlsh  
 left join  registration.project_practitioners b on
    c.project_id = b.project_id  join  registration.subject a  on a.ztid = b.ztid
    where f.htbh='201910000130';
    
    -------项目与企业关系表
    select * from  registration.project_practitioners;
    -----楼盘幢与企业关系表
    select * from registration.lpz_practitioners
