<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/taglib.jsp" %>
<%@ include file="../include/resource.jsp" %>
<%@ include file="../include/skin_portal.jsp" %>
</head>
<body>
<!--头部开始-->
<div class="topbg">
  <div class="bgright"><img src="${resources}/skin/portal/images/logo.jpg" width="431" height="104"/></div>
</div>
<div class="topsub"></div>
<!--头部结束-->

<div class="gridsub">
  <div class="theadsub">
    <h1 class="tit">>><fmt:message key="sys.title.sysHint"/> </h1>
    <p class="txt"></p>
  </div>
  <div class="boxsub">
    <div class="consub">
      <div class="listsub2">
        <fmt:message key="sys.title.fileNotFound"/>
      </div>
      <div class="clear"></div>
    </div>
  </div>
</div>
<div class="footer"><fmt:message key="biz.footer"/></div>
</body>
</html>
