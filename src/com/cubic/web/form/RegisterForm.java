package com.cubic.web.form;

import com.cubic.core.entity.SysUser;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by liang_zhang on 2015/11/18.
 */
public class RegisterForm {
  private SysUser user;
  private String attrIds;
  private String from;
  private Map<String, String> tmpParams = new HashMap<>();

  public SysUser getUser() {
    return user;
  }

  public void setUser(SysUser user) {
    this.user = user;
  }

  public String getAttrIds() {
    return attrIds;
  }

  public void setAttrIds(String attrIds) {
    this.attrIds = attrIds;
  }

  public String getFrom() {
    return from;
  }

  public void setFrom(String from) {
    this.from = from;
  }

  public Map<String, String> getTmpParams() {
    return tmpParams;
  }

  public void setTmpParams(Map<String, String> tmpParams) {
    this.tmpParams = tmpParams;
  }
}
