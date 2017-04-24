<%--
  Created by IntelliJ IDEA.
  User: liang_zhang
  Date: 2015/11/10
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/taglib.jsp" %>
<%@ include file="../include/resource.jsp" %>
<%@ include file="../include/skin_coupon.jsp" %>
</head>
<body class="boby">
<c:import url="coupon/commons/header.jsp"/>
<!--main start-->
<div class="main">
  <!--cont start-->
  <div class="syserror"><fmt:message key="sys.msg.errorCatch"/></div>
  <!--cont end-->
  <div class="main-bot"></div>
</div>
<c:import url="coupon/commons/footer.jsp"/>
</body>
</html>