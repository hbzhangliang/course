<%--
  Created by IntelliJ IDEA.
  User: liang_zhang
  Date: 2015/11/10
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/taglib.jsp" %>
<%@ include file="../../include/resource.jsp" %>
<%@ include file="../../include/skin_coupon.jsp" %>
<%@ include file="../../include/skin_proj.jsp" %>
<%--<%@ include file="../../include/skin_coupon.jsp"%>--%>
</head>
<body class="boby">
<c:import url="commons/header.jsp"/>
<!--main start-->
<div class="main">
  <!--cont start-->
  <div class="cont">
    <!--政策信息 start-->
    <div class="zcxx mb20 clearfix">
      <!--zcxx-l start-->
      <div class="zcxx-l">
        <!--nav start-->
        <div class="nav">
          <div class="nav-l">政策信息</div>
          <div class="nav-c  w500"><a href="propolicy">更多>></a></div>
          <div class="nav-r"></div>
        </div>
        <!--nav end-->
        <div class="img"><img src="${projectImageFolder}/zcxx-img-1.png" alt=""/></div>

        <div class="text">
          <h1><a href="propolicy/article/${proaList[0].id}">${proaList[0].title}</a></h1>
          <p>${proaList[0].subtitle}</p>
          <ul class="list">
            <c:forEach items="${proaList}" var="article" begin="1">
              <li><a href="propolicy/article/${article.id}">${proarticle.title}</a></li>
            </c:forEach>
          </ul>
        </div>

      </div>
      <!--zcxx-l end-->
      <!--zcxx-r start-->
      <div class="zcxx-r">
        <ul>
          <li><a href="#"><img src="${projectImageFolder}/sj.jpg"/></a></li>
          <li><a href="#"><img src="${projectImageFolder}/qj.jpg"/></a></li>
        </ul>
      </div>
      <!--zcxx-r end-->
    </div>
    <!--政策信息 end-->
    <!--申请流程 start-->
    <div class="sqlc clearfix mb20">
      <div class="sqlc-top">
        <span>项目管理流程</span>
        <ul class="sqlc-top-ul">
          <li> <img src="${projectImageFolder}/pci-a.gif"alt=""/>
        </ul>
      </div>
      <div class="sqlc-con">
        <img src="${projectImageFolder}/gl-lc.jpg"  alt="" width="912" height="754"/>
      </div>
    </div>
    <!--申请流程 end-->
    <!--会场介绍 start-->
    <!--会场介绍 end-->
  </div>
  <!--cont end-->
  <div class="main-bot"></div>
</div>
<c:import url="commons/footer.jsp"/>
</body>
</html>