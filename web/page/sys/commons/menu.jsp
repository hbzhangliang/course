<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: liang_zhang
  Date: 2014/12/23
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<!--left start-->
<div class="left clearfix">
  <h1><span onclick="window.location.href = '${base}/sys.htm'">
        <fmt:message key="sys.title.sysModule"/></span></h1>
  <ul class="sidebar">
    <c:forEach items="${menuTree}" var="menu" varStatus="i">
      <li><span id="${menu.id}"><a href="${base}/${menu.code}.htm">${menu.name}</a></span></li>
    </c:forEach>
  </ul>
</div>
<script>
  $.each($('.sidebar').find("span"), function (idx, obj) {
    if ($(obj).attr('id') == '${crtMenu.id}')
      $(obj).addClass('sid_on');
  });
</script>