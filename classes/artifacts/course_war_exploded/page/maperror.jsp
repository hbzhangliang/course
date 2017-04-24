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
  <!--left start-->
  <div class="left" id="wrapper-250">
    <c:import url="../include/menu.jsp"/>
  </div>
  <!--left end-->
  <!--right start-->
  <div class="right clearfix">
    <!--bread_crumbs start-->
    <c:import url="../include/navigation.jsp"/>
    <!--bread_crumbs end-->
	<div class="an">
    </div>
    <div align="center">
      <img src="${resources}/skin/prorep/images/busy.jpg" alt="" width="99%" height="99%"/>
    </div>
    
  <!--right end-->
  </div>
</div>
<!--main end-->
<!--footer start-->
<c:import url="../include/footer.jsp"/>
<!--footer end-->
<script>
 
</script>

</body>
</html>
