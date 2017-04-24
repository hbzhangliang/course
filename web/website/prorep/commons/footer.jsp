<%--
  Created by IntelliJ IDEA.
  User: liang_zhang
  Date: 2015/11/13
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--main end-->
<div class="footer clearfix">
  <p><fmt:message key="portal.title"/>
    <%--<fmt:message key="portal.label.serviceNum"/>--%>
    <%--<fmt:message key="portal.content.serviceNum"/></p>--%>
    企业注册服务热线:52388348  科技券申请服务热线:52388274   技术支持服务热线:<fmt:message key="portal.content.serviceNum"/>
  </p>
  <p class="browser_recommended"><fmt:message key="website.label.browserRecommended"/></p>
</div>
