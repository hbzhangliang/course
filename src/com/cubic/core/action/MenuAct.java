package com.cubic.core.action;

import com.cubic.base.action.BaseAct;
import com.cubic.core.entity.Menu;
import com.cubic.core.manager.MenuMng;
import com.cubic.core.manager.ModuleMng;
import com.cubic.util.codeHelper.PropertiesReader;
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

@Controller
@RequestMapping("/sys/menu")
public class MenuAct extends BaseAct{

  private final static Logger logger = LogManager.getLogger();

  @RequestMapping("list")
  public ModelAndView list(Menu queryBean) {
    logger.debug("menu list fired...");
    if (StringUtils.isEmpty(queryBean.getOrderBy()))
      queryBean.setOrderBy("module.seq,seq");//默认按排序号排列
    return new ModelAndView("sys/menu/list")
        .addObject("queryBean", queryBean)
        .addObject("list", menuMng.mergeHQL(queryBean, " and flag =1"));
  }

  @RequestMapping("input")
  public ModelAndView input(Menu queryBean) {
    return new ModelAndView("sys/menu/input")
        .addObject("bean", menuMng.initBean(queryBean))
        .addObject("menuList", menuMng.getCate())
        .addObject("moduleList", moduleMng.getCacheList());
  }

  @RequestMapping("save")
  public ModelAndView save(Menu bean) {
    if (StringUtils.isEmpty(bean.getParent().getId()))
      bean.setParent(null);
    if (StringUtils.isEmpty(bean.getModule().getId()))
      bean.setModule(null);
    menuMng.saveOrUpdate(bean);
    return list(bean);
  }

  @RequestMapping("ajDel")
  @ResponseBody
  public String ajDel(String id) {
    menuMng.logicalDel(id);
    return PropertiesReader.getPropertiesValue("msg.delete.success");
  }

  @RequestMapping("getSubMenu")
  @ResponseBody
  public String getSubMenu(String id) {
    return menuMng.getJSONMenu(id);
  }

  @RequestMapping("/{code}")
  public String menu(HttpSession s, @PathVariable("code") String code) {
    List<Menu> list = menuMng.getCacheSubMenu(code);
    s.setAttribute("menuCode", code);
    return "redirect:" + list.get(0).getUrl();
  }

  @RequestMapping("ajSubMenuByUser")
  @ResponseBody
  public String ajSubMenuByUser(String id, String userId) {
    return menuMng.ajSubMenuByUser(id, userId);
  }

  @RequestMapping("ajInitMenuAcl")
  @ResponseBody
  public String ajInitMenuAcl(HttpSession s) {
    return menuMng.initMenuAcl();
  }

  @RequestMapping("checkDuplicated")
  @ResponseBody
  public String checkDuplicated(String key, String value) {
    if (menuMng.checkDuplicated(null, key, value)) {
      return "duplicated";
    } else
      return "ok";
  }

  /**
   * 根据模块ID返回该模块下所有一级栏目
   *
   * @param moduleId 模块Id
   * @return 一级栏目json数据
   */
  @RequestMapping("getMenuByModule")
  @ResponseBody
  public String getMenuByModule(String moduleId, String beanId) {
    return menuMng.getMenuByModuleId(moduleId, beanId);
  }

  @Resource
  private MenuMng menuMng;

  @Resource
  private ModuleMng moduleMng;
}
