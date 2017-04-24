package com.cubic.record.manager;

import com.cubic.base.manager.BaseMng;
import com.cubic.core.entity.SysUser;
import com.cubic.record.entity.Course;

public interface CourseMng extends BaseMng<Course>{

    String delCourse(String ids);

    void saveCourse(Course bean, SysUser user);

}
