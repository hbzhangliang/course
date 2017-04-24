package com.cubic.record.action;

import com.cubic.core.entity.SysUser;
import com.cubic.core.manager.LookupsMng;
import com.cubic.record.entity.Course;
import com.cubic.record.manager.CourseMng;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cubic.base.action.BaseAct;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("record/entry/course")
public class CourseAct extends BaseAct {

    private final static Logger logger = LogManager.getLogger();

    @RequestMapping("list")
    public ModelAndView list(Course queryBean, HttpSession s){
        logger.debug("Course list fired...");
        if (StringUtils.isEmpty(queryBean.getOrderBy())){
            queryBean.setOrderBy("createTime desc");//按创建倒序排列
        }
        String hql=" and flag=1 ";
        return new ModelAndView("record/course/list")
                .addObject("queryBean", queryBean)
                .addObject("lookups_KCLX", lookupsMng.getCacheLookupsByCodeOrder("KCLX"))//课程类型
                .addObject("list", courseMng.mergeHQL(queryBean, hql));
    }

    @RequestMapping("input")
    public ModelAndView input(Course queryBean, HttpSession s){
        queryBean=courseMng.initBean(queryBean);
        return new ModelAndView("record/course/input")
                .addObject("lookups_KCLX", lookupsMng.getCacheLookupsByCodeOrder("KCLX"))//课程类型
                .addObject("bean", queryBean);
    }

    @RequestMapping("save")
    public ModelAndView save(Course queryBean, HttpSession s){
        SysUser user=getCurrentUser(s);
        courseMng.saveCourse(queryBean,user);
        return new ModelAndView("redirect:list.htm");
    }


    @RequestMapping("ajDel")
    @ResponseBody
    public String ajDel(String id){
        return  courseMng.delCourse(id);
    }




    @Resource
    private CourseMng courseMng;

    @Resource
    private LookupsMng lookupsMng;

}
