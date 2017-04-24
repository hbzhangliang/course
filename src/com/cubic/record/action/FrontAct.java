package com.cubic.record.action;

import com.cubic.base.action.BaseAct;
import com.cubic.core.entity.Attachment;
import com.cubic.core.entity.SysConfig;
import com.cubic.core.manager.AttachmentMng;
import com.cubic.core.manager.SysConfigMng;
import com.cubic.record.entity.Course;
import com.cubic.record.entity.Video;
import com.cubic.record.manager.CourseMng;
import com.cubic.record.manager.VideoMng;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by liang_zhang on 2017/4/21.
 */
@Controller
@RequestMapping("record")
public class FrontAct  extends BaseAct {
    private final static Logger logger = LogManager.getLogger();

    @RequestMapping("main")
    public ModelAndView index(Course queryBean, HttpSession s){
        return new ModelAndView("front/record/main")
                .addObject("courses",courseMng.getAll());
    }

    @RequestMapping("targetClass")
    public ModelAndView targetClass(Course queryBean, HttpSession s){
        List<Video> list=videoMng.findBy("course.id",queryBean.getId(),"seq");
        return new ModelAndView("front/record/videoList")
                .addObject("list",list)
                .addObject("course",courseMng.get(queryBean.getId()));
    }


    @RequestMapping("targetVideo")
    public ModelAndView targetVideo(Video queryBean, HttpSession s){
        logger.debug("targetVideo list fired...");
        Video video=videoMng.get(queryBean.getId());
        List<Attachment> attachment=attachmentMng.findByObjectId(video.getId());
        Attachment at=attachment==null||attachment.size()==0?null:attachment.get(0);
        String path=sysConfigMng.getCacheValue("sys.tomcat.vitualPath");
        video.setPath(path+at.getFilepath());  //路径问题，设置了tomcat 的虚拟访问路径

        String tgWeb="front/record/video";
        if(at.getFiletype().indexOf("mp4")>-1){
            tgWeb="front/record/video_mp4";
        }

        return new ModelAndView(tgWeb)
                .addObject("video",video)
                .addObject("attachment",at);
    }

    @Resource
    private CourseMng courseMng;
    @Resource
    private VideoMng videoMng;
    @Resource
    private AttachmentMng attachmentMng;
    @Resource
    private SysConfigMng sysConfigMng;

}
