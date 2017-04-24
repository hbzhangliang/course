package com.cubic.core.manager.impl;

import com.cubic.base.manager.impl.BaseMngImpl;
import com.cubic.core.entity.SysAcl;
import com.cubic.core.entity.SysUser;
import com.cubic.core.manager.SysAclMng;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service("sysAclMng")
@Transactional
public class SysAclMngImpl extends BaseMngImpl<SysAcl> implements SysAclMng {

  @Override
  public List<String> getAclsByUser(SysUser currentUser) {
    return null;
  }

  /**   avonny  获取权限数据的时候 需要like   proj.innove.%    而不是proj.innove%   所以模糊查询需要添加 点号
   * 获取权限树根节点，找出所有不带‘.’的权限key
   *
   * @param roleId 角色ID
   * @return easyui tree string
   */
  @Override
  public String getCacheAclTree(String roleId) {
    List<Map<String, Object>> list = jdbcTemplate.queryForList("SELECT pid,aclKey,NAME FROM t_core_acl" +
        " WHERE (length(aclKey)-length(replace(aclKey,'.',''))=0) ORDER BY seq ");
    String ss = "";
    ss += "[";
    for (Map<String, Object> acl : list) {
      ss += "{";
      if (jdbcTemplate.queryForList("SELECT pid FROM t_core_acl WHERE aclKey LIKE ? " +
          "AND (length(aclKey)-length(replace(aclkey,'.',''))) = 1", acl.get("aclKey") + ".%").isEmpty())
        ss += String.format("\"id\": \"%s\", \"text\": \"%s\",\"attributes\":{\"type\":\"depart\"}, \"iconCls\": \"\", \"state\": \"\"", acl.get("aclKey"), acl.get("name"));
      else
        ss += String.format("\"id\": \"%s\", \"text\": \"%s\",\"attributes\":{\"type\":\"depart\"}, \"iconCls\": \"\", \"state\": \"closed\"", acl.get("aclKey"), acl.get("name"));
      if (StringUtils.isNotEmpty(roleId) && jdbcTemplate.queryForList("SELECT * FROM t_core_role_acl WHERE ROLE_ID=? AND ACL_ID = ?", roleId, acl.get("pid")).size() == 1)
        ss += ",\"checked\":true";
      ss += "},";

    }
    ss = ss.substring(0, ss.length() - 1);
    ss += "]";
    return ss;
  }

  /**   avonny  获取权限数据的时候 需要like   proj.innove.%    而不是proj.innove%   所以模糊查询需要添加 点号
   * 获取权限树子节点，找出所有比当前结点多一个点权限key
   *
   * @param roleId 角色ID
   * @param key    父节点权限key
   * @return easyui tree string
   */
  @Override
  public String getCacheAclChildren(String roleId, String key) {
    List<Map<String, Object>> list = jdbcTemplate.queryForList("SELECT pid,aclkey,NAME FROM t_core_acl WHERE aclKey LIKE ? " +
        "and ((length(aclKey)-length(replace(aclkey,'.','')))-(length('" + key + "')-length(replace('" + key + "','.','')))) = 1 ORDER BY seq ", key + ".%");
    String ss = "";
    ss += "[";
    for (Map<String, Object> acl : list) {
      ss += "{";
      if (jdbcTemplate.queryForList("SELECT pid FROM t_core_acl WHERE aclKey LIKE ? " +
          "and ((length(aclKey)-length(replace(aclkey,'.','')))-(length('" + acl.get("aclkey") + "')-length(replace('" + acl.get("aclkey") + "','.','')))) = 1", acl.get("aclkey") + "%").isEmpty())
        ss += String.format("\"id\": \"%s\", \"text\": \"%s\",\"attributes\":{\"type\":\"depart\"}, \"iconCls\": \"\", \"state\": \"\"", acl.get("aclkey"), acl.get("name"));
      else
        ss += String.format("\"id\": \"%s\", \"text\": \"%s\",\"attributes\":{\"type\":\"depart\"}, \"iconCls\": \"\", \"state\": \"closed\"", acl.get("aclkey"), acl.get("name"));
      if (StringUtils.isNotEmpty(roleId) && jdbcTemplate.queryForList("SELECT * FROM t_core_role_acl WHERE ROLE_ID=? AND ACL_ID = ?", roleId, acl.get("pid")).size() == 1)
        ss += ",\"checked\":true";
      ss += "},";
    }
    ss = ss.substring(0, ss.length() - 1);
    ss += "]";
    return ss;
  }

  /**
   * 根据权限key获取权限对象
   *
   * @param aclKey 权限key
   * @return 权限对象
   */
  @Override
  public SysAcl loadCacheAclByKey(String aclKey) {
    return find("from SysAcl where aclKey = ?0", aclKey).get(0);
  }

  /**
   * 重写保存方法，seq自增
   *
   * @param acl 权限对象
   */
  @Override
  public void saveOrUpdate(SysAcl acl) {
    acl.setSeq(Integer.parseInt(jdbcTemplate.queryForList("SELECT max(seq)+1 AS latest FROM t_core_acl").get(0).get("latest").toString()));
    super.saveOrUpdate(acl);
  }
}
