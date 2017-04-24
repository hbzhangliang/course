package com.cubic.core.action;

import com.cubic.base.action.BaseAct;
import com.cubic.base.entity.BaseJsonResult;
import com.cubic.core.entity.RoleGroup;
import com.cubic.core.entity.SysAcl;
import com.cubic.core.entity.SysRole;
import com.cubic.core.manager.RoleGroupMng;
import com.cubic.core.manager.SysAclMng;
import com.cubic.core.manager.SysRoleMng;
import com.cubic.util.codeHelper.PropertiesReader;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
@RequestMapping("/sys/acl")
public class SysAclAct extends BaseAct {

  private final static Logger logger = LogManager.getLogger();

  @RequestMapping("index")
  public ModelAndView index() {
    return new ModelAndView("sys/acl/index");
  }

  @RequestMapping("loadAclTree")
  @ResponseBody
  public String loadAclTree(String roleId) {
    return sysAclMng.getCacheAclTree(roleId);
  }

  @RequestMapping("loadRoleTree")
  @ResponseBody
  public String loadRoleTree() {
    return sysRoleMng.getCacheRoleTree();
  }

  @RequestMapping("addRoleObject")
  @ResponseBody
  public String addRoleObject(String type, String code, String name, String seq, String groupId) {
    if (StringUtils.isNotEmpty(type))
      if ("group".equals(type))
        if (roleGroupMng.checkDuplicated(null, "groupCode", code))
          return JSONObject.fromObject(new BaseJsonResult(false, PropertiesReader.getPropertiesValue("msg.general.keyDuplicated"))).toString();
        else
          roleGroupMng.saveOrUpdate(new RoleGroup(code, name, seq));
      else if ("role".equals(type))
        if (sysRoleMng.checkDuplicated(null, "code", code))
          return JSONObject.fromObject(new BaseJsonResult(false, PropertiesReader.getPropertiesValue("msg.general.keyDuplicated"))).toString();
        else
          sysRoleMng.saveOrUpdate(new SysRole(code, name, seq, roleGroupMng.load(groupId)));
    return JSONObject.fromObject(new BaseJsonResult()).toString();
  }

  @RequestMapping("getAclChildren")
  @ResponseBody
  public String getAclChildren(String roleId, String id) {
    return sysAclMng.getCacheAclChildren(roleId, id);
  }

  @RequestMapping("getRoleChildren")
  @ResponseBody
  public String getRoleChildren(String id) {
    return sysRoleMng.getCacheRoleChildren(id);
  }

  @RequestMapping("addAcl")
  @ResponseBody
  public String addAcl(String key, String name) {
    if (sysAclMng.checkDuplicated(null, "aclKey", key))
      return JSONObject.fromObject(new BaseJsonResult(false, PropertiesReader.getPropertiesValue("msg.general.keyDuplicated"))).toString();
    sysAclMng.saveOrUpdate(new SysAcl(key, name));
    return JSONObject.fromObject(new BaseJsonResult()).toString();
  }

  @RequestMapping("saveRoleAcl")
  @ResponseBody
  public String saveRoleAcl(String roleId, String aclKey, String op) {
    logger.debug("auto save role acl fired...");
    sysRoleMng.saveRoleAcl(roleId, aclKey, op);
    return JSONObject.fromObject(new BaseJsonResult()).toString();
  }

  @RequestMapping("saveRoleUser")
  @ResponseBody
  public String saveRoleUser(String roleId, String userId, String op) {
    logger.debug("auto save role user fired...");
    sysRoleMng.saveRoleUser(roleId, userId, op);
    return JSONObject.fromObject(new BaseJsonResult()).toString();
  }

  @Resource
  private SysAclMng sysAclMng;

  @Resource
  private RoleGroupMng roleGroupMng;

  @Resource
  private SysRoleMng sysRoleMng;
}
