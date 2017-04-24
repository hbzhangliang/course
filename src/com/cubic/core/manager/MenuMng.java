package com.cubic.core.manager;

import com.cubic.base.manager.BaseMng;
import com.cubic.core.entity.Menu;
import com.cubic.core.entity.Module;
import com.cubic.core.entity.SysUser;

import java.util.List;
import java.util.Map;

public interface MenuMng extends BaseMng<Menu> {

  List<Menu> getCate();

  List<Menu> getCacheSubMenu(String code);

  List<Menu> getCacheMenuByUser(Module crtModule, SysUser user);

  String ajSubMenuByUser(String id, String userId);

  String initMenuAcl();

  void logicalDel(String id);

  String getJSONMenu(String id);

  boolean checkDuplicated(String id, String key, String value);

  List<Map<String, Object>> getCacheMenuByAcls(List<String> aclKeys, Module currentModule);

  String getMenuByModuleId(String moduleId, String beanId);
}
