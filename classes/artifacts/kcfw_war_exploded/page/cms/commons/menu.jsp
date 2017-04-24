<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: li_hongyu
  Date: 2014/12/23
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<!--left start-->
<div class="left clearfix">
  <h1><span onclick="window.location.href = '${base}/cms.htm'">
        <fmt:message key="sys.title.cmsModule"/></span></h1>
  <ul class="sidebar">
    <c:forEach items="${menuTree}" var="menu" varStatus="i">
      <li><span id="${menu.id}"><a href="${base}/${menu.code}.htm">${menu.name}</a></span></li>
    </c:forEach>
    <li><span><a href="javascript:void(0);">修改密码</a></span></li>
  </ul>
</div>
<script>
  $.each($('.sidebar').find("span"), function (idx, obj) {
    if ($(obj).attr('id') == '${crtMenu.id}')
      $(obj).addClass('sid_on');
  });
</script>