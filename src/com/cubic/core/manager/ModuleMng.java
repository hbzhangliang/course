package com.cubic.core.manager;

import com.cubic.base.manager.BaseMng;
import com.cubic.core.entity.Module;

import java.util.List;

public interface ModuleMng extends BaseMng<Module> {
  List<Module> getCacheList();

  void activate(String id, boolean active);
  
  List<String> getAclsByModule(Module m);
}
