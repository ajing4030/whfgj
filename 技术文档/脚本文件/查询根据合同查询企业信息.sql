--��ѯ���ݺ�ͬ��ѯ��ҵ��Ϣ
 select  a.* from  registration.contractnew  f   join   registration.lpz c on f.lpzlsh = c.lpzlsh  
 left join  registration.project_practitioners b on
    c.project_id = b.project_id  join  registration.subject a  on a.ztid = b.ztid
    where f.htbh='201910000130';
    
    -------��Ŀ����ҵ��ϵ��
    select * from  registration.project_practitioners;
    -----¥�̴�����ҵ��ϵ��
    select * from registration.lpz_practitioners
