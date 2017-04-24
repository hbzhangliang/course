package com.cubic.base.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by wangyinghu on 15/6/30.
 */
public class BaseWebAction {
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
  
  @InitBinder
  public void initBinder(WebDataBinder binder) {
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    dateFormat.setLenient(false);
    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));//true:允许输入空值，false:不能为空值
  }
  
  
}
