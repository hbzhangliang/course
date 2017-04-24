package com.cubic.core.manager;

import com.cubic.base.manager.BaseMng;
import com.cubic.core.entity.SysRole;

public interface SysRoleMng extends BaseMng<SysRole> {
  String getCacheRoleTree();

  String getCacheRoleChildren(String id);

  void saveRoleAcl(String roleId, String aclKey, String op);

  void saveRoleUser(String roleId, String userId, String op);
}
