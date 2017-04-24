-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`kcfw`@`%` PROCEDURE `proc_corpusageStats`(param varchar(20))
BEGIN
	/*select d.pid,d.unit_name,c.type,count(c.pid) as approcount,sum(c.amount) as count,sum(b_budget) as budget,sum(c.meeting_cost) as cost from t_biz_couponapply c inner join t_biz_corporation d on c.corp_id=d.pid
	where year(applydate)=param group by d.pid,c.type
	order by d.pid;
	*/
	DECLARE _corpId VARCHAR(50);

	declare _id varchar(50);
	declare _corpname varchar(50);
	declare _isFunc bit(1);
	declare _Atimes int(11);
	declare _Acount int(11);
	declare _Amoney varchar(50);
	declare _Btimes int(11);
	declare _Bmoney varchar(50);
	declare _totalMoney double;
	DECLARE flag INT;
	declare corpIdsCursor cursor for select pid from t_biz_corporation;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET flag=1;
	SET flag=0;
	/*创建临时表 */
	create temporary table tmp_table(id varchar(50),corpname varchar(50),isFunc bit(1),Atimes int(11),Acount int(11),Amoney varchar(50),Btimes int(11),Bmoney varchar(50), totalMoney double);
	
	
    OPEN corpIdsCursor;
	REPEAT  /*循环*/
		FETCH corpIdsCursor INTO _corpId;
				set _id=_corpId;
				set _corpname=(select unit_name from t_biz_corporation where pid=_corpId);
				set _isFunc=(select is_func from t_biz_corporation where pid=_corpId);
				set _Atimes=(select count(*) from t_biz_couponapply where corp_id=_corpId and type='AKJQ' and status not in('store') and year(applydate)=param);
				set _Acount=(select sum(amount) from t_biz_couponapply where corp_id=_corpId and  type='AKJQ'  and status not in('store') and year(applydate)=param);
				set _Amoney=(select sum(meeting_cost) from t_biz_couponapply where corp_id=_corpId and type='AKJQ'  and status not in('store') and year(applydate)=param);
				set _Btimes=(select count(*) from t_biz_couponapply where corp_id=_corpId and type='BKJQ' and  status not in('store') and year(applydate)=param);
				set _Bmoney=(select sum(meeting_cost) from t_biz_couponapply where corp_id=_corpId and type='BKJQ' and status not in('store') and year(applydate)=param);
				set _totalMoney=(select sum(meeting_cost) from t_biz_couponapply where corp_id=_corpId  and status not in('store') and year(applydate)=param);

				insert into tmp_table values(_id,_corpname,_isFunc,_Atimes,_Acount,_Amoney,_Btimes,_Bmoney,_totalMoney);
		UNTIL flag
    END REPEAT;
	 CLOSE corpIdsCursor;
	select * from tmp_table order by totalMoney desc;
	DROP TEMPORARY TABLE tmp_table;
END