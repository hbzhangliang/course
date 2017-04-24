package com.cubic.core.manager;

import com.cubic.base.manager.BaseMng;
import com.cubic.core.entity.SysDepart;
import com.cubic.core.entity.SysUser;

public interface SysDepartMng extends BaseMng<SysDepart> {
  String getCacheAjaxRoot(String scope, String q, SysUser currentUser);

  String getCacheAjaxChild(String id);

  String getJSONUser(String id);

  String getJSONDept(String q);
}
