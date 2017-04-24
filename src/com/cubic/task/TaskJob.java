package com.cubic.task;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

/**
 * Created by liang_zhang on 2015/07/16.
 */
public class TaskJob extends QuartzJobBean {

  private Task task;

  @Override
  protected void executeInternal(JobExecutionContext arg0)
      throws JobExecutionException {
    task.startTask();
  }

  public void setTask(Task task) {
    this.task = task;
  }
}