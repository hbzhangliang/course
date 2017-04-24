package com.cubic.base.action;

import com.cubic.base.entity.BaseJsonResult;
import com.cubic.core.entity.Menu;
import com.cubic.core.entity.Module;
import com.cubic.core.entity.SysUser;
import com.cubic.core.manager.SysUserMng;
import com.cubic.util.codeHelper.PropertiesReader;
import com.cubic.util.json.JSONHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by wangyinghu on 15/6/30.
 */
public class BaseAct {
  @ExceptionHandler(Exception.class)
  public String handle(Exception e, HttpServletRequest request) {
    String msg = "出现错误,请联系开发人员!";
    if (e instanceof NoSuchRequestHandlingMethodException) {
      msg = "资源不存在!";
    } else if (e instanceof HttpMessageNotWritableException) {
      msg = "服务器错误,请联系开发人员!";
    }
    e.printStackTrace();
    request.setAttribute("msg", msg);
    request.setAttribute("errordetails", e.getMessage());
    return "syserror";
  }

  @ExceptionHandler(MissingServletRequestParameterException.class)
  @ResponseBody
  public String handle() {
    return JSONHelper.formatObject(new BaseJsonResult(false, PropertiesReader.getPropertiesValue("msg.restful.invalidParams")));
  }

  @InitBinder
  public void initBinder(WebDataBinder binder) {
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    dateFormat.setLenient(false);
    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));//true:允许输入空值，false:不能为空值
  }

  public SysUser getCurrentUser(HttpSession s) {
    return (SysUser) s.getAttribute("currentUser");
  }

  public Menu getCurrentMenu(HttpSession s) {
    return (Menu) s.getAttribute("crtMenu");
  }

  public Module getCurrentModule(HttpSession s) {
    return (Module) s.getAttribute("crtModule");
  }

  public List<String> getUserAcls(HttpSession s) {
    if (s.getAttribute("userAcls") != null)
      return (List<String>) s.getAttribute("userAcls");
    else {
      List<String> acls = sysUserMng.getAclKeyByUserId(getCurrentUser(s).getId());
      s.setAttribute("userAcls", acls);
      return acls;
    }
  }

  public List<Map<String, Object>> getMenuTree(HttpSession s) {
    return (List<Map<String, Object>>) s.getAttribute("menuTree");
  }

  @Autowired
  private SysUserMng sysUserMng;
}
