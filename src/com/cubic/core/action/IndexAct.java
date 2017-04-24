package com.cubic.core.action;

import com.cubic.base.action.BaseAct;
import com.cubic.core.config.Constants;
import com.cubic.core.entity.Menu;
import com.cubic.core.entity.Module;
import com.cubic.core.entity.SysUser;
import com.cubic.core.manager.*;
import com.cubic.util.codeHelper.PropertiesReader;

import net.sf.ehcache.CacheManager;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import java.util.List;
import java.util.Map;

/**
 * Created by liang_zhang on 14-7-22.
 */
@Controller
@RequestMapping("/")
public class IndexAct extends BaseAct {
  private final static Logger logger = LogManager.getLogger();

  @RequestMapping("welcome")
  public ModelAndView welcome(HttpSession s) {
    SysUser currentUser = getCurrentUser(s);
    if (currentUser != null && sysConfigMng.getCacheValue(Constants.SYS_WHITE_LIST).contains(currentUser.getAccount()))
      //系统管理白名单用户，直接登录至系统管理
      return sys(s);
    else
      return new ModelAndView("portal");
    //return  null;
  }

  @RequestMapping("loginWin")
  public ModelAndView loginWin(String from) {
    return new ModelAndView("course/login").addObject("from", from);
  }

  @RequestMapping("validCaptcha")
  @ResponseBody
  public String validCaptcha(String keyInput, HttpSession s) {
    //return keyInput.equals(s.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY)) ? "ok" : "no";
    return "ok";
  }

  @RequestMapping("login")
  @ResponseBody
  public String login(String account, String pwd, HttpSession s) {
    logger.debug("User:" + account + " just login system ...");
    SysUser su = sysUserMng.authLogin(account, pwd);
    if (su == null) {
      return PropertiesReader.getPropertiesValue("msg.login.failed");
    } else {
      s.setAttribute("currentUser", su);
      s.setAttribute("uname", account);
      s.setAttribute("upwd", pwd);
      s.setAttribute("userAcls", sysUserMng.getAclKeyByUserId(su.getId()));
      if (sysConfigMng.getCacheValue(Constants.SYS_WHITE_LIST).contains(su.getAccount()))
        //系统管理白名单用户，直接登录至系统管理
        return "sys";
      else
        return "1";
    }
  }

  @RequestMapping("logout")
  public ModelAndView logout(HttpSession s) {
    s.setAttribute("currentUser", null);
    return new ModelAndView("redirect:/welcome.htm");
  }

  @RequestMapping("gate")
  public ModelAndView gate() {
    List<Module> modules = moduleMng.getCacheList();
    return new ModelAndView("gate")
        .addObject("modules", modules);
  }

  @RequestMapping("notAdmin")
  public ModelAndView notAdmin() {
    return new ModelAndView("notAdmin");
  }

  @RequestMapping("index")
  public ModelAndView index(HttpSession s) {
    SysUser user=getCurrentUser(s);
    List<Module> mList = moduleMng.findBy("code", sysConfigMng.getCacheValue("sys.main.module"), "");
    if (mList.size() > 0) {
      Module m = mList.get(0);
      s.setAttribute("crtModule", m);
    }
    List<Map<String, Object>> mm = menuMng.getCacheMenuByAcls(getUserAcls(s), getCurrentModule(s));
    s.setAttribute("menuTree", mm);
    s.setAttribute("userAcls", getUserAcls(s));
    s.setAttribute("affair", sysUserMng.gethandAffaires(user));
    Map<String, Object> crtMenu = mm.get(0);
    s.setAttribute("crtMenu", crtMenu);
    return jump((String) crtMenu.get("code"), s);
  }

  @RequestMapping("cms")
  public ModelAndView cms(HttpSession s) {
    s.setAttribute("crtModule", moduleMng.findBy("code", "cms", "").get(0));
    s.setAttribute("crtMenu", menuMng.findBy("code", "cms", "").get(0));
    s.setAttribute("menuTree", menuMng.findBy("parent.code", "cms", "seq"));
    return new ModelAndView("/cms/index")
        .addObject("os_arch", System.getProperty("os.arch"))
        .addObject("os_name", System.getProperty("os.name"))
        .addObject("os_version", System.getProperty("os.version"))
        .addObject("java_runtime_version", System.getProperty("java.runtime.version"))
        .addObject("activeThreadCount", Thread.activeCount());
  }

  @RequestMapping("sys")
  public ModelAndView sys(HttpSession s) {
    //首先判断在白名单中有没有此用户
    SysUser su= getCurrentUser(s);
    if (!sysConfigMng.getCacheValue(Constants.SYS_WHITE_LIST).contains(su.getAccount())){
      return new ModelAndView("notAdmin");
    }

    s.setAttribute("crtModule", moduleMng.findBy("code", "sys", "").get(0));
    s.setAttribute("crtMenu", menuMng.findBy("code", "sys", "").get(0));
    s.setAttribute("menuTree", menuMng.findBy("parent.code", "sys", "seq"));
    return new ModelAndView("/sys/index")
        .addObject("os_arch", System.getProperty("os.arch"))
        .addObject("os_name", System.getProperty("os.name"))
        .addObject("os_version", System.getProperty("os.version"))
        .addObject("java_runtime_version", System.getProperty("java.runtime.version"))
        .addObject("activeThreadCount", Thread.activeCount());
  }

  @RequestMapping("prorep")
  public ModelAndView prorep(HttpSession s){
    SysUser user=getCurrentUser(s);
    s.setAttribute("crtModule", moduleMng.findBy("code", "ProRep", "").get(0));

    List<Map<String, Object>> mm = menuMng.getCacheMenuByAcls(getUserAcls(s), getCurrentModule(s));
    s.setAttribute("menuTree", mm);
    s.setAttribute("userAcls", getUserAcls(s));
    Map<String, Object> crtMenu = mm.get(0);
    s.setAttribute("crtMenu", crtMenu);
    return jump((String) crtMenu.get("code"), s);
  }

  @RequestMapping("record")
  public ModelAndView record(HttpSession s){
    SysUser user=getCurrentUser(s);
    if (user != null && sysConfigMng.getCacheValue(Constants.SYS_WHITE_LIST).contains(user.getAccount()))
      //系统管理白名单用户，直接登录至系统管理
      return sys(s);
    else
      return new ModelAndView("front/record/index");
  }


  @RequestMapping("live")
  public ModelAndView live(HttpSession s){
    SysUser user=getCurrentUser(s);
    if (user != null && sysConfigMng.getCacheValue(Constants.SYS_WHITE_LIST).contains(user.getAccount()))
      //系统管理白名单用户，直接登录至系统管理
      return sys(s);
    else
      return new ModelAndView("front/live/index");
  }


  @RequestMapping("sendToFtp")
  @ResponseBody
  public String sendToFtp() throws Exception {
    Thread t = new Thread(robot);
    t.start();
    return PropertiesReader.getPropertiesValue("sys.title.syncSuccess");
  }

  //跳转至二级栏目
  @RequestMapping("/{code}")
  public ModelAndView jump(@PathVariable String code, HttpSession s) {
    //根据code获取栏目对象
    Menu m = menuMng.findBy("code", code, "seq").get(0);
    //如果栏目是一级栏目
    if (m.getParent() == null) {
      //若该栏目无子栏目。设定当前栏目为一级栏目
      if (m.getChildren() == null) {
        s.setAttribute("crtMenu", m);
        if (!StringUtils.isEmpty(m.getUrl()))
          return new ModelAndView("redirect:" + m.getUrl());
        else//无链接，跳转至index
          return new ModelAndView("redirect:/index.htm");
      }
      //若有子栏目，设定当前栏目为第一个子栏目,跳转至二级栏目url
      else {
        for (Map<String, Object> subMenu : getMenuTree(s)) {
          if (subMenu.get("code").equals(code)) {
            List<Map<String, Object>> subMenuByAcls = (List<Map<String, Object>>) subMenu.get("children");
            m = menuMng.findBy("code", (String) subMenuByAcls.get(0).get("code"), "").get(0);
            s.setAttribute("crtMenu", m);
            return new ModelAndView("redirect:" + m.getUrl());
          }
        }
        return new ModelAndView("redirect:/index.htm");
      }
      //若该栏目为二级栏目，设定当前栏目为二级栏目本身,跳转至二级栏目url
    } else {
      s.setAttribute("crtMenu", m);
      return new ModelAndView("redirect:" + m.getUrl());
    }
  }

  /**
   * 清除所有ehcache缓存
   *
   * @return 已清除文字信息
   */
  @RequestMapping("clrCache")
  @ResponseBody
  public String clearCache() {
    cacheManager.clearAll();
    return PropertiesReader.getPropertiesValue("msg.cache.clearDone");
  }
  
  @Resource
  private CacheManager cacheManager;

  @Resource
  private SysUserMng sysUserMng;

  @Resource
  private SysConfigMng sysConfigMng;

  @Resource
  private MenuMng menuMng;

  @Resource
  private ModuleMng moduleMng;

  @Resource
  private Runnable robot;

  @Resource
  private SysAclMng sysAclMng;

}
