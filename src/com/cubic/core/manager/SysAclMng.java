package com.cubic.core.manager;

import com.cubic.base.manager.BaseMng;
import com.cubic.core.entity.SysAcl;
import com.cubic.core.entity.SysUser;

import java.util.List;

public interface SysAclMng extends BaseMng<SysAcl> {

  List<String> getAclsByUser(SysUser currentUser);

  String getCacheAclTree(String roleId);

  String getCacheAclChildren(String roleId, String key);

  SysAcl loadCacheAclByKey(String aclKey);
}
