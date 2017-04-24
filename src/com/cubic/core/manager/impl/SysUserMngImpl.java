package com.cubic.core.manager.impl;

import com.cubic.base.manager.impl.BaseMngImpl;
import com.cubic.core.entity.SysDepart;
import com.cubic.core.entity.SysUser;
import com.cubic.core.manager.SysDepartMng;
import com.cubic.core.manager.SysUserMng;
import com.cubic.util.codeHelper.CustomerCoder;
import com.cubic.util.codeHelper.PropertiesReader;
import com.cubic.util.json.JSONHelper;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import java.util.*;

/**
 * Created by liang_zhang on 14-7-11.
 */
@Service("sysUserMng")
@Transactional
public class SysUserMngImpl extends BaseMngImpl<SysUser> implements SysUserMng {
  @Override
  public void saveOrUpdate(SysUser user) {
    if (StringUtils.isEmpty(user.getId()) && StringUtils.isEmpty(user.getPwd()))
      user.setPwd(codeGenerator.encoderMD5("123456"));
    super.saveOrUpdate(user);
  }

  /**
   * 验证登陆
   *
   * @param account 登录名
   * @param pwd     密码
   * @return 返回用户，如没有返回空
   */
  @Override
  public SysUser authLogin(String account, String pwd) {
    List<Map<String, Object>> l = jdbcTemplate.queryForList("SELECT pid AS id FROM t_core_user WHERE account = ? AND pwd = ?", account, codeGenerator.encoderMD5(pwd));
    if (l.size() > 0)
      return load((String) l.get(0).get("id"));
    return null;
  }

  @Override
  public void resetPwd(SysUser u) {
    if ("1".equals(PropertiesReader.getPropertiesValue("sys.user.pwdPolicy")))
      u.setPwd(codeGenerator.encoderMD5("123456"));
    else if ("2".equals(PropertiesReader.getPropertiesValue("pwd.policy")))
      u.setPwd(codeGenerator.encoderMD5(u.getRealName()));
    saveOrUpdate(u);
  }

  @Override
  public String ajSetRoles(SysUser user, String roleIds) {
    /*user.getRoles().clear();
    if (!StringUtils.isEmpty(roleIds.replace(" ", "")))
      for (String roleId : roleIds.split(","))
        user.getRoles().add(sysRoleMng.load(roleId));
    saveOrUpdate(user);*/
    return "ok";
  }

  /**
   * 通过单位或部门ID获得人员
   *
   * @param deptId 部门或单位ID
   * @return 人员JSON数据(登录表示及用户姓名）
   */
  @Override
  public String getCacheUserByDept(String deptId) {
    return JSONHelper.formatObject(jdbcTemplate.queryForList("SELECT C_LoginID AS id,C_Name AS realName FROM t_core_user WHERE N_Valid = 1 AND (C_CORP = ? OR C_DEPT = ?) ORDER BY N_Order", deptId, deptId));
  }

  /**
   * 获得人员JSON列表
   *
   * @param loginId     人员登录标识
   * @param realName    人员姓名
   * @param scope       查询范围（corp:本单位；dept:本部门）
   * @param currentUser 当前登陆人
   * @return JSON格式人员数据（登录标识及人员姓名）
   */
  @Override
  public String ajSearchUser(String loginId, String realName, String scope, SysUser currentUser) {
    Map<String, Object> m = new HashMap<>();
    m.put("c_loginid", loginId);
    m.put("c_name", realName);
    if (StringUtils.isNotEmpty(scope)) {
      if ("corp".equalsIgnoreCase(scope))
        m.put("c_corp", currentUser.getDepart().getId());
    }
    return JSONHelper.formatObject(sqlQuery("select c_loginid as id,C_Name as realName from t_core_user where N_Valid = 1 ", m, "n_order"));
  }

  @Override
  public SysUser valid(String userId, String loginId) {
    return null;
  }



  /**
   * 加载用户树根节点，找出所有一级部门
   *
   * @return easyui tree string
   */
  @Override
  public String loadCacheUserTree() {
    List<Map<String, Object>> departs = jdbcTemplate.queryForList("SELECT pid AS id,name FROM t_core_depart WHERE parent_id IS NULL ORDER BY seq");
    String ss = "";
    ss += "[";
    for (Map<String, Object> depart : departs) {
      ss += "{";
      List<Map<String, Object>> subDeparts = jdbcTemplate.queryForList("SELECT pid FROM t_core_depart WHERE parent_id = ?", depart.get("id"));
      List<Map<String, Object>> users = jdbcTemplate.queryForList("SELECT pid FROM t_core_user WHERE depart_id = ?", depart.get("id"));
      if (subDeparts.isEmpty() && users.isEmpty())
        ss += String.format("\"id\": \"%s\",\"text\": \"%s\",\"isDepart\":%s,\"attributes\":{\"type\":\"depart\"}, \"iconCls\": \"\", \"state\": \"\"", depart.get("id"), depart.get("name"), true);
      else
        ss += String.format("\"id\": \"%s\",\"text\": \"%s\",\"isDepart\":%s,\"attributes\":{\"type\":\"depart\"}, \"iconCls\": \"\", \"state\": \"closed\"", depart.get("id"), depart.get("name"), true);
      ss += "},";
    }
    ss = ss.substring(0, ss.length() - 1);
    ss += "]";
    return ss;
  }

  /**
   * 获取用户树子节点
   *
   * @param roleId   角色ID
   * @param departId 父节点ID
   * @return easyui tree string
   */
  @Override
  public String getCacheUserChildren(String roleId, String departId) {
    List<Map<String, Object>> departs = jdbcTemplate.queryForList("SELECT pid AS id,name FROM t_core_depart WHERE parent_id = ? ORDER BY seq", departId);
    List<Map<String, Object>> users = jdbcTemplate.queryForList("SELECT pid AS id,real_name AS name FROM t_core_user WHERE depart_id = ? ORDER BY account", departId);
    String ss = "";
    ss += "[";
    if (!departs.isEmpty())
      for (Map<String, Object> depart : departs) {
        ss += "{";
        List<Map<String, Object>> subDeparts = jdbcTemplate.queryForList("SELECT pid FROM t_core_depart WHERE parent_id = ?", depart.get("id"));
        List<Map<String, Object>> subUsers = jdbcTemplate.queryForList("SELECT pid FROM t_core_user WHERE depart_id = ?", depart.get("id"));
        if (subDeparts.isEmpty() && subUsers.isEmpty())
          ss += String.format("\"id\": \"%s\",\"text\": \"%s\",\"isDepart\":%s,\"attributes\":{\"type\":\"depart\"}, \"iconCls\": \"\", \"state\": \"\"", depart.get("id"), depart.get("name"), true);
        else
          ss += String.format("\"id\": \"%s\",\"text\": \"%s\",\"isDepart\":%s,\"attributes\":{\"type\":\"depart\"}, \"iconCls\": \"\", \"state\": \"closed\"", depart.get("id"), depart.get("name"), true);
        ss += "},";
      }
    if (!users.isEmpty())
      for (Map<String, Object> user : users) {
        ss += "{";
        ss += String.format("\"id\": \"%s\",\"text\": \"%s\",\"isDepart\":%s,\"attributes\":{\"type\":\"depart\"}, \"iconCls\": \"\", \"state\": \"\"", user.get("id"), user.get("name"), false);
        if (StringUtils.isNotEmpty(roleId) && jdbcTemplate.queryForList("SELECT * FROM t_core_user_role WHERE ROLE_ID=? AND user_id = ?", roleId, user.get("id")).size() == 1)
          ss += ",\"checked\":true";
        ss += "},";
      }
    ss = ss.substring(0, ss.length() - 1);
    ss += "]";
    return ss;
  }

  @Override
  public List<String> getAclKeyByUserId(String userId) {
    List<String> result = new ArrayList<>();
    for (Map<String, Object> acl : jdbcTemplate.queryForList("SELECT aclKey FROM t_core_acl a WHERE a.pid IN (SELECT acl_id FROM t_core_acl_user WHERE user_id = ?)", userId)) {
      result.add((String) acl.get("aclKey"));
    }
    return result;
  }

  @Override
  public String getAjaxRoot(String q) {
    List<SysDepart> list =
        q == null
            ? sysDepartMng.find("from SysDepart where 1 = 1")
            : sysDepartMng.find("from SysDepart where 1 = 1 and name like ?0", "%" + q + "%");
    String ss = "";
    ss += "[";
    for (SysDepart d : list) {
      ss += "{";
      ss += String.format("\"id\": \"%s\", \"text\": \"%s\",\"attributes\":{\"type\":\"depart\"}, \"iconCls\": \"\", \"state\": \"closed\"", d.getId(), d.getName());
      ss += "},";
    }
    ss = ss.substring(0, ss.length() - 1);
    ss += "]";
    return ss;
  }

  @Override
  public String getAjaxLeaf(String id) {
    List<SysUser> list = find("from SysUser where 1 = 1 and depart.id = ?0", id);
    String ss = "";
    ss += "[";
    for (SysUser u : list) {
      ss += "{";
      ss += String.format("\"id\": \"%s\",\"checkbox\":\"false\", \"text\": \"%s\",\"attributes\":{\"type\":\"user\"}, \"iconCls\": \"\", \"state\": \"\"", u.getId(), u.getRealName());
      ss += "},";
    }
    ss = ss.substring(0, ss.length() - 1);
    ss += "]";
    return ss;  //字符编码转换
  }

  @Override
  public String pwSetting(SysUser user) {
  	 try{
  		SysUser puser=this.get(user.getId());
  	 	puser.setPwd(codeGenerator.encoderMD5(user.getPwd()));
  	 	this.saveOrUpdate(puser);
  	 	return "1";
  	 }
  	 catch(Exception e){
  		 e.printStackTrace();
  		 return "密码修改出现错误";
  	 }
  }

  public Map<String,Object> gethandAffaires(SysUser user){
    Map<String, Object> result = new HashMap<>();
    int number=3;
    String strResult="<p>1.这几天做好demo</p><p>2.h5实现功能</p><p>3.自适应web设计</p>";
    result.put("number", number);
    result.put("info", strResult);
    return result;
  }


  @Override
  public void saveUser(SysUser bean,SysUser user){
    if(StringUtils.isEmpty(bean.getId())){ //新增
        List<SysUser> list = find("from SysUser where 1 = 1 and account = ?0", bean.getAccount());
        if(null!=list&&list.size()>0){//如果登录账号存在
          System.out.print("此登录账号已存在!");
          return;
        }
    }
    bean.setUpdater(user);
    bean.setUpdateTime(new Date());
    bean.setPwd(codeGenerator.encoderMD5(bean.getPwd()));
    this.saveOrUpdate(bean);
  }

  @Override
  public String delUser(String ids){
    try{
      for(String item:ids.split(",")){
        //jdbcTemplate.update("delete from t_biz_gradestudent where grade_id = ?",item);
        this.del(item.trim());
      }
      return PropertiesReader.getPropertiesValue("msg.delete.success");
    }
    catch (Exception e){
      e.printStackTrace();
      return PropertiesReader.getPropertiesValue("msg.delete.failed");
    }
  }

  @Autowired
  private CustomerCoder codeGenerator;

  @Resource
  private SysDepartMng sysDepartMng;


}
