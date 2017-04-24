<%--
  Created by IntelliJ IDEA.
  User: liang_zhang
  Date: 2014/12/23
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--top start-->
<div class="top">
  <dl class="user">
    <dd class="l"></dd>
    <dt class="l">
      <fmt:message key="sys.title.welcomeTitle"/><b>${currentUser.realName}</b><br/>
      <b>${currentUser.depart.name}</b>
      <a href="javascript:void(0);" onclick="logout();">[<fmt:message key="sys.title.logout"/>]</a>
  </dl>
  <div class="logo">
    <fmt:message key="portal.title"/>
    -<fmt:message key="sys.title"/>
    <a style="color: white;text-decoration: underline;" href="${base}/gate.htm"><fmt:message
        key="sys.title.jumpOtherSystem"/></a>
  </div>
</div>
<!--top start-->
