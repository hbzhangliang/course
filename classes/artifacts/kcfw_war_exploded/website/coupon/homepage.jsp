<%--
  Created by IntelliJ IDEA.
  User: farno
  Date: 2015/11/10
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/taglib.jsp" %>
<%@ include file="../../include/resource.jsp" %>
<%@ include file="../../include/skin_coupon.jsp" %>
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
          <div class="nav-l"><fmt:message key="website.label.policyInfo"/></div>
          <div class="nav-c  w500"><a href="policy"><fmt:message key="website.label.more"/> </a></div>
          <div class="nav-r"></div>
        </div>
        <!--nav end-->
        <div class="img"><img src="${couponImageFolder}/zcxx-img-1.png" alt=""/></div>
        <div class="text">
          <h1><a href="policy/article/${aList[0].id}">${aList[0].title}</a></h1>
          <p>${aList[0].subtitle}</p>
          <ul class="list">
            <c:forEach items="${aList}" var="article" begin="1">
              <li><a href="policy/article/${article.id}">${article.title}</a></li>
            </c:forEach>
          </ul>
        </div>
      </div>
      <!--zcxx-l end-->
      <!--zcxx-r start-->
      <div class="zcxx-r">
        <ul>
          <%--<li><a href="${base}/couponA.htm"><img src="${couponImageFolder}/sl.png" alt=""/></a></li>--%>
          <%--<li><a href="${base}/limit.htm"><img src="${couponImageFolder}/cx.jpg" alt=""/></a></li>--%>
            <li><a href=""><img src="${couponImageFolder}/sl.png" alt=""/></a></li>
            <li><a href=""><img src="${couponImageFolder}/cx.jpg" alt=""/></a></li>
        </ul>
      </div>
      <!--zcxx-r end-->
    </div>
    <!--政策信息 end-->
    <!--申请流程 start-->
    <div class="sqlc clearfix mb20">
      <div class="sqlc-top">
        <span><fmt:message key="website.label.applyProcess"/> </span>
        <ul class="sqlc-top-ul">
          <li><img src="${couponImageFolder}/qyf.png" alt=""/><fmt:message key="website.label.corporation"/></li>
          <li><img src="${couponImageFolder}/ptf.png" alt=""/><fmt:message key="website.label.platform"/></li>
          <li class="last"><img src="${couponImageFolder}/hcf.png" alt=""/><fmt:message
              key="website.label.serviceProvider"/></li>
        </ul>
      </div>
      <div class="sqlc-con">
        <img src="${couponImageFolder}/sqlc.jpg" alt=""/>
      </div>
    </div>
    <!--申请流程 end-->
    <!--会场介绍 start-->
    <div class="hcjs clearfix">
      <div class="nav">
        <div class="nav-l"><fmt:message key="website.label.sitesSummary"/></div>
        <div class="nav-c  w745"><a href="showSite"><fmt:message key="website.label.more"/></a></div>
        <div class="nav-r"></div>
      </div>
      <!--hcjs-cont start-->
      <c:forEach items="${sList}" var="siteInfo" varStatus="i">
        <div class="hcjs-cont dotted-2
          <c:choose>
            <c:when test="${i.index==0}">mr20 mb20 pt10</c:when>
            <c:when test="${i.index==1}">mb20 pt10</c:when>
            <c:when test="${i.index==2}">mr20</c:when>
          </c:choose>">
          <div class="hcjs-l">
          		<img src="${siteInfo.tmpParams['picFtpPath']}" width="175px;" height="113px;"/>
<%--             <img src="getArticlePic/${siteInfo.encodedId}" width="175px;" height="113px;"/> --%>
            <span class="hcjs-org"><img src="${couponImageFolder}/hcjs-img5.png" alt=""/></span>
            <strong class="hcjs-tex">${siteInfo.name}</strong>
          </div>
          <div class="hcjs-r">
            <p><strong><fmt:message key="website.label.provider"/>：</strong><span>${siteInfo.provider.name}</span><br>
              <strong><fmt:message key="website.label.siteArea"/>：</strong>${siteInfo.area}M<sup>2</sup><br>
              <strong><fmt:message key="website.label.siteCapacity"/>：</strong>${siteInfo.capacity}人<br>
              <strong><fmt:message key="website.label.siteFunc"/>：</strong><span
                  title="${siteInfo.func}">${siteInfo.func}</span><br>
            </p>
            <dl>
              <dd><img src="${couponImageFolder}/hcjs-img2.png" alt=""/></dd>
              <dd><img src="${couponImageFolder}/hcjs-img3.png" alt=""/></dd>
              <dd><img src="${couponImageFolder}/hcjs-img4.png" alt=""/></dd>
            </dl>
          </div>
        </div>
      </c:forEach>
      <!--hcjs-cont end-->
    </div>
    <!--会场介绍 end-->
  </div>
  <!--cont end-->
  <div class="main-bot"></div>
</div>
<c:import url="commons/footer.jsp"/>
</body>
</html>