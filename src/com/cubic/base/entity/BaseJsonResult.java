package com.cubic.base.entity;

import com.cubic.util.codeHelper.PropertiesReader;

import java.util.HashMap;

/**
 * Created by liang_zhang on 2015/07/20.
 */
public class BaseJsonResult extends HashMap<String, Object> {
  public BaseJsonResult() {
    put("success", true);
    put("message", PropertiesReader.getPropertiesValue("msg.restful.success"));
  }

  public BaseJsonResult(boolean success, String message) {
    put("success", success);
    put("message", message);
  }
}
