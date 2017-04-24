package com.cubic.record.action;

import com.cubic.core.entity.SysUser;
import com.cubic.core.manager.LookupsMng;
import com.cubic.record.entity.Course;
import com.cubic.record.entity.Video;
import com.cubic.record.manager.CourseMng;
import com.cubic.record.manager.VideoMng;
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
@RequestMapping("/record/entry/video")
public class VideoAct extends BaseAct {
    private final static Logger logger = LogManager.getLogger();

    @RequestMapping("list")
    public ModelAndView list(Video queryBean, HttpSession s){
        logger.debug("Viedo list fired...");
        if (StringUtils.isEmpty(queryBean.getOrderBy())){
            queryBean.setOrderBy("createTime desc");//按创建倒序排列
        }
        String hql=" and flag=1 ";
        return new ModelAndView("record/video/list")
                .addObject("queryBean", queryBean)
                .addObject("lookups_SPLX", lookupsMng.getCacheLookupsByCodeOrder("SPLX"))//视频格式
                .addObject("list", videoMng.mergeHQL(queryBean, hql));
    }

    @RequestMapping("input")
    public ModelAndView input(Video queryBean, HttpSession s){
        queryBean=videoMng.initBean(queryBean);
        return new ModelAndView("record/video/input")
                .addObject("courses", courseMng.find(" from Course where flag =1 "))//所有课程
                .addObject("lookups_SPLX", lookupsMng.getCacheLookupsByCodeOrder("SPLX"))//视频格式
                .addObject("bean", queryBean);
    }

    @RequestMapping("save")
    public ModelAndView save(Video queryBean, HttpSession s){
        SysUser user=getCurrentUser(s);
        videoMng.saveVideo(queryBean,user);
        return new ModelAndView("redirect:list.htm");
    }


    @RequestMapping("ajDel")
    @ResponseBody
    public String ajDel(String id){
        return  videoMng.delVideo(id);
    }

    @Resource
    private VideoMng videoMng;

    @Resource
    private CourseMng courseMng;

    @Resource
    private LookupsMng lookupsMng;
}
