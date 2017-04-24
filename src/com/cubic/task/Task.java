package com.cubic.task;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Component;

/**
 * Created by liang_zhang on 2015/07/16.
 */
@Component("task")
public class Task {

  private final static Logger logger = LogManager.getLogger();

  public void startTask() {
    logger.debug("auto start timed task");
  }


}
