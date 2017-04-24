package com.cubic.core.interceptor;

/**
 * Created by liang_zhang on 2015/06/23.
 */

import com.cubic.core.entity.SysUser;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;
import java.math.BigInteger;
import java.util.Random;

/**
 * <p>
 * 防止重复提交过滤器
 * </p>
 */
@Component("tokenInterceptor")
public class AvoidDuplicateSubmissionInterceptor extends HandlerInterceptorAdapter {
  private final static Logger logger = LogManager.getLogger();

  @Override
  public boolean preHandle(HttpServletRequest request,
                           HttpServletResponse response, Object handler) throws Exception {

    SysUser user = (SysUser) request.getSession().getAttribute("currentUser");
    if (user != null) {
      HandlerMethod handlerMethod = (HandlerMethod) handler;
      Method method = handlerMethod.getMethod();

      AvoidDuplicateSubmission annotation = method.getAnnotation(AvoidDuplicateSubmission.class);
      if (annotation != null) {
        boolean needSaveSession = annotation.needSaveToken();
        if (needSaveSession) {
          request.getSession(false).setAttribute("token", generateGUID());
        }
        boolean needRemoveSession = annotation.needRemoveToken();
        if (needRemoveSession) {
          if (isRepeatSubmit(request)) {
            logger.warn("please don't repeat submit,[user:" + user.getRealName() + ",url:"
                + request.getServletPath() + "]");
            return false;
          }
          request.getSession(false).removeAttribute("token");
        }
      }
    }
    return true;
  }

  private boolean isRepeatSubmit(HttpServletRequest request) {
    String serverToken = (String) request.getSession(false).getAttribute("token");
    if (serverToken == null) {
      return true;
    }
    String clientToken = request.getParameter("token");
    return clientToken == null || !serverToken.equals(clientToken);
  }

  private synchronized static String generateGUID() {
    return new BigInteger(165, new Random()).toString(36)
        .toUpperCase();
  }
}
