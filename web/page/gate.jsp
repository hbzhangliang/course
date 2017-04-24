<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/taglib.jsp" %>
<%@ include file="../include/resource.jsp" %>
<%@ include file="../include/skin_default.jsp" %>
</head>
<body>
<!--top start-->
<c:import url="../include/top.jsp"/>
<!--top end-->
<!--main start-->
<div class="main clearfix">
  <div style="height:600px;text-align: left;">
    请选择要进入的模块<br/><br/>
    <!--left start-->
    <c:forEach items="${modules}" var="module">
      <a style="padding-left: 20px;font-size: 20px;color: blue;"
         href="${base}/sys/module/${module.code}.htm">${module.name}</a><br/><br/>
    </c:forEach>
    <!--right end-->
  </div>
</div>
<!--main end-->
<!--footer start-->
<c:import url="../include/footer.jsp"/>
<!--footer end-->
</body>
</html>
