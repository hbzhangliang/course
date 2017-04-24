
insert into t_biz_serviceprovider(pid,flag,updatetime,updater,name)
values('0e66d0dc177c4b68a4ca6ed01f9ab801',1,NOW(),-1,'IBP国际会议中心');

insert into t_biz_siteinfo(pid,flag,updatetime,updater,provider_id,name)
values('d6317a11dbc0438d9adcb177bb1a6f01',1,now(),-1,'0e66d0dc177c4b68a4ca6ed01f9ab801','贰号会议室');

insert into t_biz_corporation(pid,flag,updatetime,updater,unit_name)
values('defa9b88d70b4993b22cf187e0574701',1,NOW(),-1,'佰万仓');
insert into t_biz_corporation(pid,flag,updatetime,updater,unit_name)
values('defa9b88d70b4993b22cf187e0574702',1,NOW(),-1,'宝典投资');
insert into t_biz_corporation(pid,flag,updatetime,updater,unit_name)
values('defa9b88d70b4993b22cf187e0574703',1,NOW(),-1,'长宁区府办');
insert into t_biz_corporation(pid,flag,updatetime,updater,unit_name)
values('defa9b88d70b4993b22cf187e0574704',1,NOW(),-1,'长宁区科委');
insert into t_biz_corporation(pid,flag,updatetime,updater,unit_name)
values('defa9b88d70b4993b22cf187e0574705',1,NOW(),-1,'虹桥互联网金融发展服务部');
insert into t_biz_corporation(pid,flag,updatetime,updater,unit_name)
values('defa9b88d70b4993b22cf187e0574706',1,NOW(),-1,'互联网金融协会');
insert into t_biz_corporation(pid,flag,updatetime,updater,unit_name)
values('defa9b88d70b4993b22cf187e0574707',1,NOW(),-1,'领路人');
insert into t_biz_corporation(pid,flag,updatetime,updater,unit_name)
values('defa9b88d70b4993b22cf187e0574708',1,NOW(),-1,'南极圈');
insert into t_biz_corporation(pid,flag,updatetime,updater,unit_name)
values('defa9b88d70b4993b22cf187e0574709',1,NOW(),-1,'凭安企业');
insert into t_biz_corporation(pid,flag,updatetime,updater,unit_name)
values('defa9b88d70b4993b22cf187e0574710',1,NOW(),-1,'轩天');
insert into t_biz_corporation(pid,flag,updatetime,updater,unit_name)
values('defa9b88d70b4993b22cf187e0574711',1,NOW(),-1,'易念信息科技');

insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116601',1,now(),-1,'defa9b88d70b4993b22cf187e0574705','d6317a11dbc0438d9adcb177bb1a6f01','2014005','互联网金融基地座谈会',str_to_date('2014-12-4', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116602',1,now(),-1,'defa9b88d70b4993b22cf187e0574705','d6317a11dbc0438d9adcb177bb1a6f01','2014008','中原油田行业协会参观调研座谈会',str_to_date('2014-12-16', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116603',1,now(),-1,'defa9b88d70b4993b22cf187e0574705','d6317a11dbc0438d9adcb177bb1a6f01','2014009','长宁区科技园区（孵化器）总结务虚会',str_to_date('2014-12-16', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116604',1,now(),-1,'defa9b88d70b4993b22cf187e0574705','d6317a11dbc0438d9adcb177bb1a6f01','2015032','虹桥互联网金融财富天地相关工作情况汇报会',str_to_date('2015-3-4', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116605',1,now(),-1,'defa9b88d70b4993b22cf187e0574705','d6317a11dbc0438d9adcb177bb1a6f01','2015036','长宁区政协十三届十次主席集体下基层座谈会',str_to_date('2015-3-13', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116606',1,now(),-1,'defa9b88d70b4993b22cf187e0574708','d6317a11dbc0438d9adcb177bb1a6f01','2015041','极课堂彩排',str_to_date('2015-3-26', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116607',1,now(),-1,'defa9b88d70b4993b22cf187e0574705','d6317a11dbc0438d9adcb177bb1a6f01','2015044','市经信委走访调研会',str_to_date('2015-3-26', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116608',1,now(),-1,'defa9b88d70b4993b22cf187e0574705','d6317a11dbc0438d9adcb177bb1a6f01','2015047','屠光绍常务副市长莅临指导',str_to_date('2015-4-2', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116609',1,now(),-1,'defa9b88d70b4993b22cf187e0574705','d6317a11dbc0438d9adcb177bb1a6f01','2015048','政协经济委员会全体会议',str_to_date('2015-4-13', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116610',1,now(),-1,'defa9b88d70b4993b22cf187e0574711','d6317a11dbc0438d9adcb177bb1a6f01','2015061','信息安全技能竞赛训练营培训',str_to_date('2015-5-20', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116611',1,now(),-1,'defa9b88d70b4993b22cf187e0574711','d6317a11dbc0438d9adcb177bb1a6f01','2015062','信息安全技能竞赛训练营培训',str_to_date('2015-5-21', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116612',1,now(),-1,'defa9b88d70b4993b22cf187e0574711','d6317a11dbc0438d9adcb177bb1a6f01','2015063','信息安全技能竞赛训练营培训',str_to_date('2015-5-22', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116613',1,now(),-1,'defa9b88d70b4993b22cf187e0574711','d6317a11dbc0438d9adcb177bb1a6f01','2015064','信息安全技能竞赛训练营培训',str_to_date('2015-5-23', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116614',1,now(),-1,'defa9b88d70b4993b22cf187e0574711','d6317a11dbc0438d9adcb177bb1a6f01','2015065','信息安全技能竞赛训练营培训',str_to_date('2015-5-24', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116615',1,now(),-1,'defa9b88d70b4993b22cf187e0574704','d6317a11dbc0438d9adcb177bb1a6f01','2015068','欢迎51社保',str_to_date('2015-5-13', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116616',1,now(),-1,'defa9b88d70b4993b22cf187e0574705','d6317a11dbc0438d9adcb177bb1a6f01','2015075','欢迎济南市政协调研组莅临参观指导',str_to_date('2015-5-15', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116617',1,now(),-1,'defa9b88d70b4993b22cf187e0574703','d6317a11dbc0438d9adcb177bb1a6f01','2015082','政府企业沟通会',str_to_date('2015-5-29', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116618',1,now(),-1,'defa9b88d70b4993b22cf187e0574705','d6317a11dbc0438d9adcb177bb1a6f01','2015085','互联网安全警钟长鸣闭门会议',str_to_date('2015-6-4', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116619',1,now(),-1,'defa9b88d70b4993b22cf187e0574702','d6317a11dbc0438d9adcb177bb1a6f01','2015088','宝典工作会议',str_to_date('2015-6-3', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116620',1,now(),-1,'defa9b88d70b4993b22cf187e0574705','d6317a11dbc0438d9adcb177bb1a6f01','2015097','凭安业务汇报大会',str_to_date('2015-6-15', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116621',1,now(),-1,'defa9b88d70b4993b22cf187e0574709','d6317a11dbc0438d9adcb177bb1a6f01','2015111','2015年凭安合作伙伴大会',str_to_date('2015-7-17', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116622',1,now(),-1,'defa9b88d70b4993b22cf187e0574709','d6317a11dbc0438d9adcb177bb1a6f01','2015112','2015年凭安合作伙伴大会',str_to_date('2015-7-18', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116623',1,now(),-1,'defa9b88d70b4993b22cf187e0574707','d6317a11dbc0438d9adcb177bb1a6f01','2015117','领先贷暨众创空间战略合作签约仪式',str_to_date('2015-7-26', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116624',1,now(),-1,'defa9b88d70b4993b22cf187e0574705','d6317a11dbc0438d9adcb177bb1a6f01','2015124','区府办会议',str_to_date('2015-7-30', '%Y-%m-%d'),0,1);	
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116625',1,now(),-1,'defa9b88d70b4993b22cf187e0574706','d6317a11dbc0438d9adcb177bb1a6f01','2015127','后意见时代，互联网金融的创新与投资机会在哪里？',str_to_date('2015-8-14', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116626',1,now(),-1,'defa9b88d70b4993b22cf187e0574704','d6317a11dbc0438d9adcb177bb1a6f01','2015129','互联网金融与大数据征信市场创新研讨会',str_to_date('2015-8-17', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116627',1,now(),-1,'defa9b88d70b4993b22cf187e0574710','d6317a11dbc0438d9adcb177bb1a6f01','2015130','工作交流会',str_to_date('2015-8-19', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116628',1,now(),-1,'defa9b88d70b4993b22cf187e0574709','d6317a11dbc0438d9adcb177bb1a6f01','2015138','凭安产品发布会',str_to_date('2015-9-17', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116629',1,now(),-1,'defa9b88d70b4993b22cf187e0574704','d6317a11dbc0438d9adcb177bb1a6f01','2015144','“科创中心”系列主席督办提案',str_to_date('2015-9-15', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116630',1,now(),-1,'defa9b88d70b4993b22cf187e0574701','d6317a11dbc0438d9adcb177bb1a6f01','2015148','佰万仓内部会议',str_to_date('2015-9-23', '%Y-%m-%d'),0,1);
insert into t_biz_couponapply(pid,flag,updatetime,updater,corp_id,site_id,meeting_seq,meeting_name,meeting_date,meeting_cost,amount)
values('baa37923-755b-4f12-be82-b4bd4b116631',1,now(),-1,'defa9b88d70b4993b22cf187e0574701','d6317a11dbc0438d9adcb177bb1a6f01','2015149','佰万仓内部会议',str_to_date('2015-9-23', '%Y-%m-%d'),0,1);
