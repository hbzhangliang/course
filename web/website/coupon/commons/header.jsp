<%--
  Created by IntelliJ IDEA.
  User: liang_zhang
  Date: 2015/11/13
  Time: 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="couponImageFolder" value="${base}/web-resources/resources/skin/coupon/images"/>
<!--header start-->
<div class="header-bg">
  <div class="header auto">
    <div class="login-1">
      <dl>
        <c:if test="${currentUser==null}">
          <dt><input name="" type="image" src="${couponImageFolder}/home-bt.png"
                     onclick="location.href='${base}'">
          </dt>
          <dt><input name="" type="image" src="${couponImageFolder}/login.png"
                     onclick="location.href='${base}/loginWin.htm?from=${currentSection==null?currentHome.code:currentSection.code}'">
          </dt>
          <dt><input name="" type="image" src="${couponImageFolder}/index_05.png"
                     onclick="location.href='${base}/register?from=${currentSection==null?currentHome.code:currentSection.code}'"></dt>
        </c:if>
        <c:if test="${currentUser!=null}">
          <dt class="pt5">
            <a href="${base}/welcome.htm" class="nav1"><fmt:message key="website.label.portal"/></a>
          </dt>
          <dt class="pt5">
            <a href="${base}/sys/module/kcfw.htm" class="nav1"><fmt:message key="website.label.backend"/></a>
          </dt>
          <dt class="pt5">
            <span><fmt:message key="sys.title.welcomeTitle"/>${currentUser.realName}</span>
          </dt>
        </c:if>
      </dl>
    </div>
    <ul class="couponsec_menu">
      <li><a href="${base}/${currentHome.code}"
             <c:if test="${currentSection.code eq currentHome.code}">class="menu_active"</c:if>>
        <fmt:message key="website.label.homepage"/></a></li>
      <c:forEach items="${sectionMenus}" var="section">
        <li><a href="${base}/${section.url}"
               <c:if test="${section.code eq currentSection.code}">class="menu_active"</c:if>>
            ${section.name}</a>
        </li>
      </c:forEach>
    </ul>
  </div>
</div>
<!--header end-->
