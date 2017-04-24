package com.cubic.util.codegen;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Created by liang_zhang on 14-7-21.
 */
public class CodeGenerator {

  private static final Logger log = LogManager.getLogger();

  private static final String[] excludeFields = new String[]{"pid","flag","create_by","create_time","modify_by","modify_time"};
  //private static final String[] excludeFields = new String[]{"pid,flag,updatetime,updater"};
  //private static final String[] excludeFields = new String[]{"pid"};
  private static final String model = "com.cubic.record.entity.Video";

  private static final String manager = "com.cubic.record.manager.VideoMng";

  private static final String action = "com.cubic.record.action.VideoAct";

  private static final String table = "t_biz_video";

  private static final String accessUrl = "/video/list";

  public static void main(String[] args) throws Exception {
    log.debug("代码生成开始");

    EntityGen.gen(model, table, excludeFields);

    ManagerGen.gen(manager, model);

    ActionGen.gen(action, manager, accessUrl);

    log.debug("代码生成结束");

  }
}
