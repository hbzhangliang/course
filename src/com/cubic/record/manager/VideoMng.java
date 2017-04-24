package com.cubic.record.manager;

import com.cubic.base.manager.BaseMng;
import com.cubic.core.entity.SysUser;
import com.cubic.record.entity.Video;

public interface VideoMng extends BaseMng<Video>{

    void saveVideo(Video bean, SysUser user);

    String delVideo(String ids);
}
