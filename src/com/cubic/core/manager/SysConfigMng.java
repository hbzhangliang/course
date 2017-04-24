package com.cubic.core.manager;

import com.cubic.base.manager.BaseMng;
import com.cubic.core.entity.SysConfig;

public interface SysConfigMng extends BaseMng<SysConfig> {
  String getCacheValue(String key);

  void setValue(String key, String value, String remark);

  String getValue(String key);
}
