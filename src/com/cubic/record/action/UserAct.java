package com.cubic.record.action;

import com.cubic.base.action.BaseAct;
import com.cubic.core.entity.SysUser;
import com.cubic.core.manager.LookupsMng;
import com.cubic.core.manager.SysDepartMng;
import com.cubic.core.manager.SysUserMng;
import com.cubic.record.entity.Course;
import com.cubic.record.entity.Video;
import com.cubic.record.manager.CourseMng;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by liang_zhang on 2017/4/20.
 */
@Controller
@RequestMapping("record/sysmanage/user")
public class UserAct extends BaseAct {
    private final static Logger logger = LogManager.getLogger();

    @RequestMapping("list")
    public ModelAndView list(SysUser queryBean, HttpSession s){
        logger.debug("Sysuser list fired...");
        if (StringUtils.isEmpty(queryBean.getOrderBy())){
            queryBean.setOrderBy("updateTime desc");//按创建倒序排列
        }
        String hql=" and flag=1 ";
        return new ModelAndView("record/sysmanage/list")
                .addObject("queryBean", queryBean)
                .addObject("lookups_YHLX", lookupsMng.getCacheLookupsByCodeOrder("YHLX"))//用户类型
                .addObject("list", sysUserMng.mergeHQL(queryBean, hql));
    }

    @RequestMapping("input")
    public ModelAndView input(SysUser queryBean, HttpSession s){
        queryBean=sysUserMng.initBean(queryBean);
        return new ModelAndView("record/sysmanage/input")
                .addObject("departs", sysDepartMng.find(" from SysDepart where flag =1 "))//所有部门
                .addObject("lookups_YHLX", lookupsMng.getCacheLookupsByCodeOrder("YHLX"))//用户类型
                .addObject("bean", queryBean);
    }

    @RequestMapping("save")
    public ModelAndView save(SysUser queryBean, HttpSession s){
        SysUser user=getCurrentUser(s);
        sysUserMng.saveUser(queryBean,user);
        return new ModelAndView("redirect:list.htm");
    }

    @RequestMapping("ajDel")
    @ResponseBody
    public String ajDel(String id){
        return  sysUserMng.delUser(id);
    }

    @Resource
    private SysUserMng sysUserMng;
    @Resource
    private LookupsMng lookupsMng;
    @Resource
    private SysDepartMng sysDepartMng;
}
