package com.cubic.web.action;

import com.cubic.base.action.BaseWebAction;
import com.cubic.core.manager.AttachmentMng;
import com.cubic.core.manager.LookupsMng;
import com.cubic.core.manager.SysConfigMng;
import com.cubic.core.manager.SysUserMng;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * Created by liang_zhang on 2015/11/12.
 */
@Controller
public class WebAction extends BaseWebAction {
  @RequestMapping("/")
  public ModelAndView welcome() {
    return new ModelAndView("redirect:welcome.htm");
  }

  @RequestMapping("/{code}")
  public ModelAndView jump(@PathVariable("code") String code, HttpSession s) {

      return null;
  }


  @Autowired
  private SysUserMng sysUserMng;

  @Autowired
  private AttachmentMng attachmentMng;

  @Autowired
  private SysConfigMng sysConfigMng;

  @Autowired
  private LookupsMng lookupsMng;

}
