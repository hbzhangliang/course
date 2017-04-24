package com.cubic.core.util;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by liang_zhang on 2015/9/7.
 */
@Service("robot")
public class Robot implements Runnable{
  @Override
  public void run() {
    try {
      ftpTools.startUploadToFTP();
    } catch (Exception e) {
      e.printStackTrace();
    }finally {
      try {
        ftpTools.disconnect();
      } catch (FtpTools.FTPClientException e) {
        e.printStackTrace();
      }
    }
  }

  @Resource
  private FtpTools ftpTools;
}
