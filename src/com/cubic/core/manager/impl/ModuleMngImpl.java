package com.cubic.core.manager.impl;

import com.cubic.base.manager.impl.BaseMngImpl;
import com.cubic.core.entity.Menu;
import com.cubic.core.entity.Module;
import com.cubic.core.manager.MenuMng;
import com.cubic.core.manager.ModuleMng;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

@Service("moduleMng")
@Transactional
public class ModuleMngImpl extends BaseMngImpl<Module> implements ModuleMng {

  @Override
  public List<Module> getCacheList() {
    return find("from Module where activated = 1 order by seq");
  }

  @Override
  public void activate(String id, boolean activated) {
    Module module = load(id);
    module.setActivated(activated);
    saveOrUpdate(module);
  }

@Override
public List<String> getAclsByModule(Module m) {
	 try {
	      List<Menu> aclAll = menuMng.findBy("module.code", "kcfw", "seq");
	      if (aclAll != null) {
	        List<String> acls = new ArrayList<String>();
	        for (Menu acl : aclAll)
	            acls.add(acl.getAclKey());
	        return acls;
	      }
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	    return null;
}
@Resource
private MenuMng menuMng;
}
