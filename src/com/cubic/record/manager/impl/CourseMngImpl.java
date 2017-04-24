package com.cubic.record.manager.impl;

import com.cubic.base.manager.impl.BaseMngImpl;
import com.cubic.core.entity.SysUser;
import com.cubic.record.entity.Course;
import com.cubic.record.manager.CourseMng;
import com.cubic.util.codeHelper.PropertiesReader;
import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.annotation.Resource;
import java.util.Date;

@Service("courseMng")
@Transactional
public class CourseMngImpl extends BaseMngImpl<Course> implements CourseMng{

    private final static Logger logger = LogManager.getLogger();

    @Override
    public void saveCourse(Course bean, SysUser user){
        Date dt=new Date();
        if(StringUtils.isEmpty(bean.getId())) { //新增
            bean.setCreateTime(dt);
            bean.setCreator(user);

            this.save(bean);
        }
        else{
            bean.setModifyTime(dt);
            bean.setModify(user);

            this.saveOrUpdate(bean);
        }
    }

    @Override
    public String delCourse(String ids){
        try{
            for(String item:ids.split(",")){
                //jdbcTemplate.update("delete from t_biz_gradestudent where grade_id = ?",item);
                this.del(item.trim());
            }
            return PropertiesReader.getPropertiesValue("msg.delete.success");
        }
        catch (Exception e){
            e.printStackTrace();
            return PropertiesReader.getPropertiesValue("msg.delete.failed");
        }
    }


    @Resource
    public JdbcTemplate jdbcTemplate;

}
