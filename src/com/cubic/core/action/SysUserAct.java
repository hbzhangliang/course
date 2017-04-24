package com.cubic.core.action;

import com.cubic.base.action.BaseAct;
import com.cubic.core.entity.SysUser;
import com.cubic.core.manager.SysUserMng;
import com.cubic.util.codeHelper.PropertiesReader;
import com.cubic.util.json.JSONHelper;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * Created by liang_zhang on 14-7-10.
 */
@Controller
@RequestMapping("/sys/user")
public class SysUserAct extends BaseAct {

  private static final Logger logger = LogManager.getLogger();

  @RequestMapping("list")
  public ModelAndView list(SysUser queryBean) {
    logger.debug("SysUser list fired");
    if (StringUtils.isEmpty(queryBean.getOrderBy()))
      queryBean.setOrderBy("depart");//默认按部门排列
    return new ModelAndView("sys/user/list")
        .addObject("queryBean", queryBean)
        .addObject("list", sysUserMng.mergeHQL(queryBean, ""));
  }

  @RequestMapping(value = "ajList")
  @ResponseBody
  public String ajList(SysUser bean) {
    bean.setOrderBy("depart");
    return JSONHelper.formatObject(sysUserMng.mergeHQL(bean, ""));
  }

  @RequestMapping("pwd")
  public ModelAndView pwd(HttpSession s) {
    return new ModelAndView("sys/user/pwd")
        .addObject("bean", sysUserMng.load(((SysUser) s.getAttribute("currentUser")).getId()));
  }

  @RequestMapping("input")
  public ModelAndView input(SysUser queryBean) {
    return new ModelAndView("sys/user/input")
        .addObject("bean", sysUserMng.initBean(queryBean));
  }

  @RequestMapping(value = "save")
  public ModelAndView save(SysUser bean) {
    if (StringUtils.isEmpty(bean.getDepart().getId()))
      bean.setDepart(null);
    sysUserMng.saveOrUpdate(bean);
    return new ModelAndView("redirect:/sys/user/list.htm");
  }

  @RequestMapping("ajDel")
  @ResponseBody
  public String ajDel(String id) {
    return PropertiesReader.getPropertiesValue("msg.delete.success");
  }

  @RequestMapping("ajRoot")
  @ResponseBody
  public String ajRoot(String q) {
    logger.debug("sysUser ajax list fired");
    return sysUserMng.getAjaxRoot(q);
  }

  @RequestMapping("ajLeaf")
  @ResponseBody
  public String ajLeaf(@RequestParam(value = "id") String id) {
    logger.debug("sysUser ajax list children fired");
    return sysUserMng.getAjaxLeaf(id);
  }

  @RequestMapping("ajSetRole")
  @ResponseBody
  public String ajSetRole(String objId, String roleIds) {
    logger.debug("sysUser ajax set role fired");
    return sysUserMng.ajSetRoles(sysUserMng.load(objId), roleIds);
  }

  @RequestMapping("getCacheUserByDept")
  @ResponseBody
  public String getCacheUserByDept(String deptId) {
    return sysUserMng.getCacheUserByDept(deptId);
  }

  @RequestMapping("ajSearchUser")
  @ResponseBody
  public String ajSearchUser(String loginId, String realName, String scope, HttpSession s) {
    return sysUserMng.ajSearchUser(loginId, realName, scope, getCurrentUser(s));
  }

  @RequestMapping("loadUserTree")
  @ResponseBody
  public String loadUserTree() {
    return sysUserMng.loadCacheUserTree();
  }

  @RequestMapping("getUserChildren")
  @ResponseBody
  public String getUserChildren(String roleId, String id) {
    return sysUserMng.getCacheUserChildren(roleId, id);
  }

  @RequestMapping("pwSetting")
  @ResponseBody
  public String pwSetting(SysUser user){
	  return sysUserMng.pwSetting(user);
  }
  
  
  @Autowired
  private SysUserMng sysUserMng;
}
