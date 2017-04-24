package com.cubic.core.manager.impl;

import com.cubic.base.manager.impl.BaseMngImpl;
import com.cubic.core.entity.SysRole;
import com.cubic.core.entity.SysUser;
import com.cubic.core.manager.SysAclMng;
import com.cubic.core.manager.SysRoleMng;
import com.cubic.core.manager.SysUserMng;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service("sysRoleMng")
@Transactional
public class SysRoleMngImpl extends BaseMngImpl<SysRole> implements SysRoleMng {

  /**
   * 加载权限树根节点 找出所有分组
   *
   * @return easyui tree string
   */
  @Override
  public String getCacheRoleTree() {
    List<Map<String, Object>> list = jdbcTemplate.queryForList("SELECT pid AS id,name FROM t_core_role_group ORDER BY seq");
    String ss = "";
    ss += "[";
    for (Map<String, Object> roleGroup : list) {
      ss += "{";
      if (jdbcTemplate.queryForList("SELECT pid FROM t_core_role WHERE group_id = ?", roleGroup.get("id")).isEmpty())
        ss += String.format("\"id\": \"%s\", \"text\": \"%s\", \"isGroup\":%s,\"iconCls\": \"\", \"state\": \"\"", roleGroup.get("id"), roleGroup.get("name"), true);
      else
        ss += String.format("\"id\": \"%s\", \"text\": \"%s\", \"isGroup\":%s,\"iconCls\": \"\", \"state\": \"closed\"", roleGroup.get("id"), roleGroup.get("name"), true);
      ss += "},";
    }
    ss = ss.substring(0, ss.length() - 1);
    ss += "]";
    return ss;
  }

  /**
   * 加载权限树子节点
   *
   * @param groupId 权限分组ID
   * @return easyui tree string
   */
  @Override
  public String getCacheRoleChildren(String groupId) {
    List<Map<String, Object>> list = jdbcTemplate.queryForList("SELECT pid AS id,name FROM t_core_role WHERE group_id = ? ORDER BY seq", groupId);
    String ss = "";
    ss += "[";
    for (Map<String, Object> role : list) {
      ss += "{";
      ss += String.format("\"id\": \"%s\", \"text\": \"%s\",\"isGroup\":%s,\"iconCls\": \"\", \"state\": \"\"", role.get("id"), role.get("name"), false);
      ss += "},";
    }
    ss = ss.substring(0, ss.length() - 1);
    ss += "]";
    return ss;
  }

  /**
   * 自动保存角色-权限关系
   *
   * @param roleId 角色ID
   * @param aclKey 权限KEY
   * @param op     操作（a:添加；r:移除）
   */
  @Override
  public void saveRoleAcl(String roleId, String aclKey, String op) {
    SysRole role = load(roleId);
    if ("a".equals(op))
      role.getAcls().add(sysAclMng.loadCacheAclByKey(aclKey));
    else if ("r".equals(op))
      role.getAcls().remove(sysAclMng.loadCacheAclByKey(aclKey));
    saveOrUpdate(role);
  }

  /**
   * 自动保存角色-权限关系
   *
   * @param roleId 角色ID
   * @param userId 用户ID
   * @param op     操作（a:添加；r:移除）
   */
  @Override
  public void saveRoleUser(String roleId, String userId, String op) {
    SysRole role = load(roleId);
    SysUser user = sysUserMng.load(userId);
    if ("a".equals(op))
      user.getAcls().addAll(role.getAcls());
    else if ("r".equals(op))
      user.getAcls().removeAll(role.getAcls());
    sysUserMng.saveOrUpdate(user);
    if ("a".equals(op))
      role.getUsers().add(user);
    else if ("r".equals(op))
      role.getUsers().remove(user);
    super.saveOrUpdate(role);
  }

  @Autowired
  private SysAclMng sysAclMng;

  @Autowired
  private SysUserMng sysUserMng;

}
