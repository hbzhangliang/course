package com.cubic.core.manager;

import com.cubic.base.manager.BaseMng;
import com.cubic.core.entity.SysUser;

import java.util.List;
import java.util.Map;

/**
 * Created by liang_zhang on 14-7-11.
 */

public interface SysUserMng extends BaseMng<SysUser> {
  SysUser authLogin(String account, String pwd);

  void resetPwd(SysUser user);

  String getAjaxRoot(String q);

  String getAjaxLeaf(String id);

  String ajSetRoles(SysUser user, String roleIds);

  String getCacheUserByDept(String deptId);

  String ajSearchUser(String loginId, String realName, String scope, SysUser currentUser);

  SysUser valid(String userId, String loginId);



  String loadCacheUserTree();

  String getCacheUserChildren(String roleId, String id);

  List<String> getAclKeyByUserId(String userId);
  
  String pwSetting(SysUser user);

  Map<String,Object> gethandAffaires(SysUser user);

  void saveUser(SysUser bean,SysUser user);

  String delUser(String ids);

}
