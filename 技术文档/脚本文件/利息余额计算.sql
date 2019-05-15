select  
  (select nvl(t.remainder,0)  from ys.account t where t.account_no='205221103614')+
  ( select nvl(sum(p.pay),0) from ys.pay p where p.accountno='' and p.state=3 and p.zlsh>0)+
  ( select nvl(sum(r.refund),0) from ys.refund r where r.account_no='205221103614' and r.state=3 )-
  (select nvl(sum(n.deposit),0) from ys.notice n where n.account_no='205221103614' and n.state=3)
  from dual 
