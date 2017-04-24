package com.cubic.core.interceptor;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Set;

/**
 * Created by liang_zhang on 14-7-29.
 */
public class AclInterceptor implements HandlerInterceptor {

    private static final Logger logger = LogManager.getLogger();

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse response, Object o) throws Exception {
        logger.debug("AclInterceptor fired ...");
        Set<String> aclSet = (Set<String>) httpServletRequest.getSession().getAttribute("aclSet");
        String currentUrl = httpServletRequest.getRequestURI();
        logger.debug(currentUrl);
        if (aclSet != null && aclSet.size() > 0) {
            int flag = 0;
            for (String acl : aclSet) {
                if (currentUrl.contains(acl)) {
                    flag = 1;
                    break;
                }
            }
            if (flag == 0) {
                httpServletRequest.setAttribute("message", "没有足够的权限");
                httpServletRequest.getRequestDispatcher("/index.htm").forward(httpServletRequest, response);
            } else
                return true;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse response, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse response, Object o, Exception e) throws Exception {

    }
}
