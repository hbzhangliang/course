<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/taglib.jsp" %>
<%@ include file="../include/resource.jsp" %>
<%@ include file="../include/skin_default.jsp" %>
</head>
<body>
<!--top start-->
<div class="head auto">
</div>
<!--top start-->
<div class="main auto clearfix">
  <!--tit start-->
  <div class="tit" style="margin: 5px; padding: 10px;">
    <div class="tit_l">
      <div class="tit_l_tit">${msg}</div>
    </div>
    <div style="padding-left: 180px; font-size: 14px;">
      ${errordetails}
    </div>
  </div>
</div>
</body>
</html>
