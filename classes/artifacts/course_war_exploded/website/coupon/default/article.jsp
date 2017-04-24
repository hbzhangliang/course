<%--
  Created by IntelliJ IDEA.
  User: liang_zhang
  Date: 2015/11/10
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_coupon.jsp" %>
</head>
<body class="boby">
<c:import url="../commons/header.jsp"/>
<!--main start-->
<div class="main">
  <!--cont start-->
  <div class="cont">
    <div class="inform">
      <h1 class="pt10">${article.title}</h1>
      <div style="text-align: center;">
        <h6 class="pt10">作者：${article.author.realName}&nbsp;&nbsp;&nbsp;发布时间：
          <fmt:formatDate value="${article.publishDate}" pattern="yyyy-MM-dd HH:mm"/></h6>
      </div>
      ${article.content}
    </div>
  </div>
  <!--cont end-->
  <div class="main-bot"></div>
</div>
<!--main end-->
<c:import url="../commons/footer.jsp"/>
</body>
</html>