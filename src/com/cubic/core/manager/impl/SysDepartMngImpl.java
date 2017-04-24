package com.cubic.core.manager.impl;

import com.cubic.base.manager.impl.BaseMngImpl;
import com.cubic.core.entity.SysDepart;
import com.cubic.core.entity.SysUser;
import com.cubic.core.manager.SysDepartMng;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Service("sysDepartMng")
@Transactional
public class SysDepartMngImpl extends BaseMngImpl<SysDepart> implements SysDepartMng {

  @Override
  public List<SysDepart> getAll() {
    return find("from SysDepart order by code asc");
  }

  /**
   * 获得缓存部门列表（JSON）
   *
   * @param scope       查询范围（corp:本单位，dept:本部门）
   * @param q           查询参数
   * @param currentUser 当前登录人
   * @return 部门JSON数据（部门ID，名称，级别）
   */
  @Override
  public String getCacheAjaxRoot(String scope, String q, SysUser currentUser) {
    Map<String, Object> m = new HashMap<String, Object>();
    List<Map<String, Object>> list;
    if (StringUtils.isNotEmpty(scope)) {
      if ("corp".equalsIgnoreCase(scope))
        m.put("eq_pid", currentUser.getDepart().getId());
      list = sqlQuery("select pid as id,c_name as name,N_Level as level from T_CORE_DEPART where n_valid = 1 ", m, "N_order");
    } else {
      list = sqlQuery("select pid as id,c_name as name,N_Level as level from T_CORE_DEPART where n_valid = 1 and c_pid is null", m, "N_order");
    }
    String ss = "";
    ss += "[";
    for (Map<String, Object> d : list) {
      ss += "{";
      Set<SysDepart> cs = load((String) d.get("id")).getChildren();    //判断当前节点是否还有子节点
      if (cs.size() == 0) { //没有子节点  设置 state 为空
        ss += String.format("\"id\": \"%s\",\"level\": \"%s\", \"text\": \"%s\", \"iconCls\": \"\", \"state\": \"\"", d.get("id"), d.get("level"), d.get("name"));
      } else {        // 还有子节点 设置 state为closed
        ss += String.format("\"id\": \"%s\",\"level\": \"%s\", \"text\": \"%s\", \"iconCls\": \"\", \"state\": \"closed\"", d.get("id"), d.get("level"), d.get("name"));
      }
      ss += "},";
    }
    ss = ss.substring(0, ss.length() - 1);
    ss += "]";
    return ss;
  }

  /**
   * 获得子节点
   *
   * @param id 父节点ID
   * @return 子节点部门列表（部门ID，名称，级别）
   */
  @Override
  public String getCacheAjaxChild(String id) {
    Map<String, Object> m = new HashMap<String, Object>();
    m.put("eq_c_pid", id);
    List<Map<String, Object>> list = sqlQuery("select pid as id,name from T_CORE_DEPART where flag=1 ", m, "seq");
    String ss = "";
    ss += "[";
    for (Map<String, Object> d : list) {
      ss += "{";
      Set<SysDepart> cs = load((String) d.get("id")).getChildren();    //判断当前节点是否还有子节点
      if (cs.size() == 0) { //没有子节点  设置 state 为空
        ss += String.format("\"id\": \"%s\", \"level\": \"%s\", \"text\": \"%s\", \"iconCls\": \"\", \"state\": \"\"", d.get("id"), d.get("level"), d.get("name"));
      } else {        // 还有子节点 设置 state为closed
        ss += String.format("\"id\": \"%s\", \"level\": \"%s\",\"text\": \"%s\", \"iconCls\": \"\", \"state\": \"closed\"", d.get("id"), d.get("level"), d.get("name"));
      }
      ss += "},";
    }
    ss = ss.substring(0, ss.length() - 1);
    ss += "]";
    return ss;  //字符编码转换
  }

  @Override
  public String getJSONUser(String id) {
    return "123";
  }

  /**
   * 获得部门JSON对象
   *
   * @param q 部门名称查询字段
   * @return 部门JSON对象（部门ID，名称，级别）
   */
  @Override
  public String getJSONDept(String q) {
    Map<String, Object> m = new HashMap<String, Object>();
    m.put("c_name", q);
    List<Map<String, Object>> list = sqlQuery("select pid as id,c_name as name,N_Level as level from T_CORE_DEPART where n_valid=1 ", m, "N_order");
    String ss = "";
    ss += "[";
    for (Map<String, Object> d : list) {
      ss += "{";
      ss += String.format("\"id\": \"%s\",\"level\": \"%s\", \"text\": \"%s\", \"iconCls\": \"\", \"state\": \"\"", d.get("id"), d.get("level"), d.get("name"));
      ss += "},";
    }
    ss = ss.substring(0, ss.length() - 1);
    ss += "]";
    return ss;
  }

  public void saveOrUpdate(SysDepart dept) {
    if (dept.getParent() == null || StringUtils.isEmpty(dept.getParent().getId()))
      dept.setParent(null);
    super.saveOrUpdate(dept);
  }
}
