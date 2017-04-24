CREATE 
VIEW `v_corp_usage` AS
    select 
        `c`.`pid` AS `pid`,
        `d`.`type` AS `type`,
        sum(`d`.`amount`) AS `amount`,
        sum(`d`.`meeting_cost`) AS `cost`
    from
        `t_biz_corporation` `c`
        left join `t_biz_couponapply` `d` ON `c`.`pid` = `d`.`corp_id`
    where
        year(`d`.`start_date`) = year(now())
            and `d`.`status` not in ('store' , 'apply', 'notapproved')
    group by `d`.`type` , `c`.`pid`
    order by `c`.`pid`