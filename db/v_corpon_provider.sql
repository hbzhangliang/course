CREATE 
VIEW `v_coupon_provider` AS
    select 
        `c`.`pid` AS `pid`,
        `c`.`type` AS `type`,
        `c`.`seq` AS `seq`,
        `c`.`meeting_number` AS `meetingNumber`,
        `c`.`meeting_name` AS `meetingname`,
        `c`.`amount` AS `amount`,
        `c`.`start_date` AS `starttime`,
        `c`.`status` AS `status`,
        `s`.`provider_id` AS `providerid`,
        `r`.`site_Id` AS `sid`,
        `n`.`pid` AS `userId`,
        group_concat(`s`.`name`
            separator ',') AS `sitenames`
    from
        `t_biz_couponapply` `c`
        join `t_biz_coupon_site_rel` `r` ON `r`.`apply_Id` = `c`.`pid`
        join `t_biz_siteinfo` `s` ON `s`.`pid` = `r`.`site_Id`
        join `t_biz_serviceprovider` `m` ON `s`.`provider_id` = `m`.`pid`
        join `t_core_user` `n` ON `m`.`account` = `n`.`account`
    where
        (`c`.`flag` <> 0)
    group by `c`.`pid`
    order by `c`.`pid`