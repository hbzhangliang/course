CREATE 
VIEW `v_coupon_summary` AS
    select 
        `c`.`pid` AS `pid`,
        `c`.`type` AS `type`,
        `c`.`seq` AS `seq`,
        `c`.`meeting_name` AS `meetingname`,
        `c`.`amount` AS `amount`,
        `c`.`start_date` AS `starttime`,
        `c`.`status` AS `status`,
        `s`.`provider_id` AS `providerid`,
        `r`.`site_Id` AS `sid`,
        group_concat(`s`.`name`
            separator ',') AS `sitenames`
    from
        ((`t_biz_couponapply` `c`
        left join `t_biz_coupon_site_rel` `r` ON ((`r`.`apply_Id` = `c`.`pid`)))
        left join `t_biz_siteinfo` `s` ON ((`s`.`pid` = `r`.`site_Id`)))
    where
        (`c`.`flag` <> 0)
    group by `c`.`pid`
    order by `c`.`pid`