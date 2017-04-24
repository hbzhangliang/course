-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`kcfw`@`%` PROCEDURE `proc_siteusageStats`(start_time datetime,end_time datetime,pcorp_id varchar(50), pprovider_Id varchar(50))
BEGIN
	declare _siteId varchar(50);
	declare _id varchar(50); 
	declare _providerName varchar(50);
	declare _siteName varchar(50);
	declare _singleTimes int(11);
	declare _unionTimes int(11);
	declare _singleCount int(11);
	declare _unionCount int(11);
	declare _singleMoney double;
	declare _unionMoney double;
	DECLARE flag INT;
	declare siteIdsCursor cursor for select pid from t_biz_siteinfo; -- 游标定义为site的编号
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET flag=1;
	SET flag=0;

	create temporary table sites_Tmptable(id varchar(50),providerName varchar(50),siteName varchar(50),singleTimes int(11),unionTimes int(11),singleCount int(11),unionCount int(11),singleMoney double,unionMoney double);
	create temporary table tmp_coupon_provider(pid varchar(50),type varchar(8),seq varchar(50),meetingNumber varchar(100),meetingname varchar(200),amount int(11),cost decimal(19,4),starttime date,status varchar(50),providerid varchar(50),sid text,userId varchar(50),sitenames text);
	
	if pcorp_id='' then  Insert into tmp_coupon_provider select * from v_coupon_provider where (starttime between start_time and end_time);
	else Insert into tmp_coupon_provider select * from v_coupon_provider where pid in (select pid from t_biz_couponapply where corp_id=pcorp_id) and (starttime between start_time and end_time);
	end if;

	OPEN siteIdsCursor;
	REPEAT  /*循环*/
		FETCH siteIdsCursor INTO _siteId;
		if(flag=0) THEN
			
				set _id=_siteId;
				set _providerName=(select d.name as name from t_biz_siteinfo c inner join t_biz_serviceprovider d on c.provider_id=d.pid where c.pid=_siteId);
				set _siteName=(select name from t_biz_siteinfo where pid=_siteId);
				set _singleTimes=(select count(*) from tmp_coupon_provider where  sid =_siteId);  -- 单独的
				set _unionTimes=(select count(*) from tmp_coupon_provider where  sid like CONCAT('%',_siteId,'%') and locate(',',sid)>0);
				set _singleCount=(select sum(amount) from tmp_coupon_provider where sid =_siteId); 
				set _unionCount=(select sum(amount) from tmp_coupon_provider where sid like CONCAT('%',_siteId,'%') and locate(',',sid)>0);
				set _singleMoney=(select sum(cost) from tmp_coupon_provider where sid =_siteId); 
				set _unionMoney=(select sum(cost) from tmp_coupon_provider where sid like CONCAT('%',_siteId,'%') and locate(',',sid)>0); 
				
			insert into sites_Tmptable values(_id,_providerName,_siteName,_singleTimes,_unionTimes,_singleCount,_unionCount,_singleMoney,_unionMoney);
		 end if;
		UNTIL flag
	END REPEAT;
	CLOSE siteIdsCursor;
	if (pprovider_Id='') then select * from sites_Tmptable order by singleMoney desc;
	else  select * from sites_Tmptable where id in (select pid from t_biz_siteinfo where provider_id=pprovider_Id) order by singleMoney desc;
	end if;
	Drop temporary table tmp_coupon_provider;
	DROP TEMPORARY TABLE sites_Tmptable;

END