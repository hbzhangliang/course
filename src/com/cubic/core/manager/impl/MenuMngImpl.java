package com.cubic.core.manager.impl;

import com.cubic.base.entity.BaseJsonResult;
import com.cubic.base.manager.impl.BaseMngImpl;
import com.cubic.core.entity.Menu;
import com.cubic.core.entity.Module;
import com.cubic.core.entity.SysUser;
import com.cubic.core.manager.MenuMng;
import com.cubic.util.codeHelper.PropertiesReader;
import com.cubic.util.codeHelper.StringHelper;
import com.cubic.util.json.JSONHelper;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service("menuMng")
@Transactional
public class MenuMngImpl extends BaseMngImpl<Menu> implements MenuMng {

  /**
   * 获得一级菜单
   *
   * @return 一级栏目列表
   */
  @Override
  public List<Menu> getCate() {
    return find("from Menu where 1 = 1 and parent is null and name is not null order by seq");
  }

  /**
   * 通过menuCode获得子菜单
   *
   * @param id 栏目编码
   * @return 子栏目列表
   */
  @Override
  public List<Menu> getCacheSubMenu(String id) {
    return find("from Menu where 1 = 1 and parent.id = ?0 order by seq", id);
  }

  /**
   * 通过用户获得可访问的一级栏目列表
   *
   * @param crtModule 当前模块
   * @param user      用户对象
   * @return 指定用户可访问的一级栏目列表
   */
  @Override
  public List<Menu> getCacheMenuByUser(Module crtModule, SysUser user) {
   /*if (user != null) {
      user = sysUserMng.load(user.getId());
      Set<Menu> menus = new HashSet<Menu>();
      for (SysRole r : user.getRoles())
        for (SysAcl acl : r.getAcls())
          if ("01".equals(acl.getType()) && acl.getMenu().getParent() == null)
            menus.add(acl.getMenu());
      Comparator c = new ComparatorImpl();
      List<Menu> menuList = new ArrayList<Menu>();
      menuList.addAll(menus);
      Collections.sort(menuList, c);
      return menuList;
    } else {
      return find("from Menu where flag = 1 and parent is null and code <> 'sys' order by seq");
    }*/
    return find("from Menu where module.id = ?0 and flag = 1 and parent is null and code <> 'sys' order by seq", crtModule.getId());
  }

  /**
   * 通过栏目ID获得可访问的子栏目列表
   *
   * @param id     栏目ID
   * @param userId 用户ID
   * @return 指定用户可访问的子栏目列表
   */
  @Override
  public String ajSubMenuByUser(String id, String userId) {
    /*SysUser user = sysUserMng.load(userId);
    Set<Menu> menus = new HashSet<Menu>();
    for (SysRole r : user.getRoles())
      for (SysAcl acl : r.getAcls())
        if ("01".equals(acl.getType()) && acl.getMenu().getParent() != null && id.equals(acl.getMenu().getParent().getId()))
          menus.add(acl.getMenu());
    Comparator c = new ComparatorImpl();
    List<Menu> menuList = new ArrayList<Menu>();
    menuList.addAll(menus);
    Collections.sort(menuList, c);
    JsonConfig jc = new JsonConfig();
    jc.setExcludes(new String[]{"updater", "parent", "pm", "params", "updateTime"});
    return JSONArray.fromObject(menuList, jc).toString();*/
    return null;
  }

  /**
   * 初始化菜单权限
   * 初始化规则：权限Key设置为：模块code+父菜单code+菜单code+'menu'
   *
   * @return 成功字符串
   */
  @Override
  public String initMenuAcl() {
    for (Menu m : findOrderBy("from Menu where flag = 1", "module.seq,seq")) {
      m = get(m.getId());
      m.setAclKey(m.getModule().getCode() + "."
          + (m.getParent() == null ? m.getCode() + "." : (m.getParent().getCode() + "." + m.getCode() + "."))
          + "menu");
      saveOrUpdate(m);
    }
    return PropertiesReader.getPropertiesValue("sys.title.ok");
  }

  @Override
  public void logicalDel(String id) {
    Menu menu = load(id);
    menu.setFlag(false);
    saveOrUpdate(menu);
  }

  @Override
  public String getJSONMenu(String id) {
    Menu m = get(id);
    List<Menu> list;
    if (m.getSeq().contains("99"))
      list = getCacheSubMenu(id);
    else {
      list = getCacheSubMenu(m.getParent().getId());
    }
    return JSONHelper.formatObject(list);
  }

  /**
   * 根据权限获取菜单（等待优化）
   *
   * @param acls          权限点列表
   * @param currentModule 当前模块
   * @return 菜单map
   */
  @Override
  public List<Map<String, Object>> getCacheMenuByAcls(List<String> acls, Module currentModule) {
    if (currentModule != null && currentModule.getCode() != null && "sys".equals(currentModule.getCode())) {
      return jdbcTemplate.queryForList("SELECT pid AS id,name,code,url FROM t_core_menu WHERE flag = 1 AND acl_key LIKE 'sys%' ORDER BY seq");
    } else {
      List<Map<String, Object>> list;
      StringBuilder sb = new StringBuilder();
      if (acls == null || acls.isEmpty()) {
        list = jdbcTemplate.queryForList("SELECT pid AS id,parent_id AS parent,name,code,url FROM t_core_menu WHERE flag = 1 AND (acl_key IS NULL OR acl_key = '') ORDER BY seq");
      } else {
        for (String aclKey : acls) {
          if (aclKey.startsWith(StringHelper.upperCastFirstChar(currentModule.getCode()))) {
            sb.append("'").append(aclKey).append("',");
          }
          if (aclKey.startsWith(currentModule.getCode())) {
            sb.append("'").append(aclKey).append("',");
          }
        }
        sb.delete(sb.length() - 1, sb.length());
        list = jdbcTemplate.queryForList("select pid as id,parent_id as parent,name,code,url from t_core_menu where flag = 1 and ((acl_key in (" + sb.toString() + ")) or (acl_key is null or acl_key='')) order by seq");
      }
      List<Map<String, Object>> result = new ArrayList<>();
      List<Map<String, Object>> tmp = new ArrayList<>();
      List<Map<String, Object>> children;
      for (Map<String, Object> m : list) {
        if (m.get("parent") == null) {
          tmp.add(m);
        }
      }
      for (Map<String, Object> m : tmp) {
        children = new ArrayList<>();
        for (Map<String, Object> sub : list) {
          if (sub.get("parent") != null && sub.get("parent").equals(m.get("id")))
            children.add(sub);
        }
        m.put("children", children);
        result.add(m);
      }
      return result;
    }
  }

  @Override
  public String getMenuByModuleId(String moduleId, String beanId) {
    Map<String, Object> result = new BaseJsonResult();
    List<Map<String, Object>> list = jdbcTemplate.queryForList("SELECT pid AS id,name FROM t_core_menu WHERE MODULE_ID = ? AND PARENT_ID IS NULL AND flag = 1 ORDER BY SEQ", moduleId);
    result.put("data", list);
    if (StringUtils.isNotEmpty(beanId))
      result.put("parentId", jdbcTemplate.queryForList("SELECT PARENT_ID AS parent FROM t_core_menu WHERE pid = ?", beanId).get(0).get("parent").toString());
    return JSONObject.fromObject(result).toString();
  }
}
