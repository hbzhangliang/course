<%--
  Created by IntelliJ IDEA.
  User: farno
  Date: 2015/11/10
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_coupon.jsp" %>
<%@ include file="../../../include/skin_proj.jsp" %>
</head>
<body class="boby">
<c:import url="../commons/header.jsp"/>
<!--main start-->
<div class="main">
  <!--cont start-->
  <div class="cont">
    <div class="nav">
      <div class="nav-l">${currentSection.name}</div>
      <div class="nav-c  w745"><a href="#"></a></div>
      <div class="nav-r"></div>
    </div>
    <!--list start-->
    <div class="list clearfix">
      <ul>
        <c:forEach items="${webHelps}" var="webHelp">
          <li class="faq">
            <div class="faq_q">
              Q:${webHelp.question}
            </div>
            <br/>
            <div class="faq_a">
              A:${webHelp.answer}
            </div><br/>
            <HR class="faq_hr" width="100%" color=#7d9fcb SIZE=1>
            <Br/>
          </li>
        </c:forEach>
      </ul>
    </div>
    <!--list end-->
  </div>
  <!--cont end-->
  <div class="main-bot"></div>
</div>
<!--main end-->
<c:import url="../commons/footer.jsp"/>
</body>
</html>