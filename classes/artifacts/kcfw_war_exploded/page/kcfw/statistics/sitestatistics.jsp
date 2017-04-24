<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_default.jsp" %>
</head>
<body>
<!--top start-->
<c:import url="../../../include/top.jsp"/>
<!--top end-->
<!--main start-->
<div class="main clearfix">
  <!--left start-->
  <div class="left" id="wrapper-250">
    <c:import url="../../../include/menu.jsp"/>
  </div>
  <!--left end-->
  <!--right start-->
  <div class="right clearfix">
    <!--bread_crumbs start-->
    <c:import url="../../../include/navigation.jsp"/>
    <!--bread_crumbs end-->
	<div class="an">
		时间选择  起:<input id='txt_startTime' type='text' class='w_109' onclick='boundTime(this)'> 
		止:<input id='txt_endTime' type='text' class='w_109' onclick='boundTime(this)'> 
		<button type="button" onclick="doSearch()" class="ico_search">
          查询</button>
    </div>
    <!--bt end-->
    <!--table start-->
    <table class="table_01">
      <tr>
        <th width="10%">会场提供商名称</th>
        <th width="10%">会场名称</th>
        <th width="15%">总使用次数</th>
        <th width="15%">总科技券(张)</th>
        <th width="15%">总金额(元)</th>
      </tr>
      <c:forEach items="${result}" var="bean" varStatus="i">
      	<tr>
          <td>${bean.providerName}</td>
          <td>${bean.siteName}</td>
          <td>${bean.useTimes}</td>
          <td>${bean.useCount}</td>
          <td>${bean.useMoney}</td>
        </tr>
      </c:forEach>
    </table>
    <!--table end-->
  <!--right end-->
  </div>
</div>
<!--main end-->
<!--footer start-->
<c:import url="../../../include/footer.jsp"/>
<!--footer end-->
<script>
  $(function(){
	  $("#txt_startTime").val("${startTime}");
	  $("#txt_endTime").val("${endTime}");
  });
  
  function boundTime(item){
	  $(item).bind('click', WdatePicker);
  }

  	function doSearch(){
  		window.location.href=base+'/statistics/sitestastic/list.htm?startTime='+$("#txt_startTime").val()+'&endTime='+$("#txt_endTime").val();
  	}
</script>

</body>
</html>
