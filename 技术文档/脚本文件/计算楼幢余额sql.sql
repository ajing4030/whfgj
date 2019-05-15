select 
((select sum(t.deposit) from ys.notice t where t.zlsh=2014000355 and t.state=3)
-(select sum(t.pay) from ys.pay t where t.zlsh=2014000355 and t.hblx=0  and t.state=3 )
-(select sum(t.refund) from ys.refund t where t.zlsh=2014000355 and t.state=3)) ye from dual
;
select * from   ys.notice t where t.zlsh=2014000355  and t.state=1

select 
((select sum(t.deposit) from ys.notice t where t.zlsh=2014000354 and t.state=3)
-(select sum(t.pay) from ys.pay t where t.zlsh=2014000354 and t.hblx=0  and t.state=3 )
-(select sum(t.refund) from ys.refund t where t.zlsh=2014000354 and t.state=3)) ye from dual

select * from ys.notice t where t.zlsh=2016000783
select sum(t.deposit) from ys.notice t where t.zlsh=2016000783 and t.state=3;


select 
((select sum(t.deposit) from ys.notice t where t.zlsh=2016000783 and t.state=3)
-(select sum(t.pay) from ys.pay t where t.zlsh=2016000783 and t.hblx=0  and t.state=3 )
-(select sum(t.refund) from ys.refund t where t.zlsh=2016000783 and t.state=3)) ye from dual


--41274786
--38909000
--ÍË¿î123750
