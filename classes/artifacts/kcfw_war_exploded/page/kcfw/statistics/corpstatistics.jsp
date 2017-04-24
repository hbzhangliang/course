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
		企业名称 <input type="text" id="txt_unitname"/>
		<button type="button" onclick="doSearch()" class="ico_search">
          查询</button>
    </div>
    <!--bt end-->
      <table class="table_01" style="margin-bottom: 15px;">
          <tr>
              <th width="10%">当前年份</th>
              <th width="10%">券种</th>
              <th width="10%">总金额(万)</th>
              <th width="10%">已使用金额(万)</th>
              <th width="10%">剩余金额(万)</th>
           </tr>
          <tr>
              <td rowspan="2">${yearusemap[0]['year']}</td>
              <td>A券</td>
              <td>500.00</td>
              <td>${yearusemap[0]['cost']}</td>
              <td>${yearusemap[0]['left']}</td>
          </tr>
          <tr>
              <td>B券</td>
              <td>500.00</td>
              <td>${yearusemap[1]['cost']}</td>
              <td>${yearusemap[1]['left']}</td>
          </tr>
      </table>

    <!--table start-->
    <table class="table_01">
      <tr>
        <th width="10%">企业名称</th>
        <th width="10%">企业类型</th>
        <th width="10%">A券申请总次数</th>
        <th width="10%">A券申请总张数</th>
        <th width="10%">A券申请总金额</th>
        <th width="10%">B券申请总次数</th>
        <th width="10%">B券申请总金额</th>
        <th width="10%">企业总申请金额</th>
      </tr>
      <c:forEach items="${resule}" var="bean" varStatus="i">
          <tr>
          <td>${bean.corpname}</td>
<%--           <c:if test="${bean.isFunc eq '1'}"> --%>
<!--           	<td>功能服务型机构</td> -->
<%--           </c:if> --%>
<%--           <c:if test="${bean.isFunc != '1'}"> --%>
<!--           	<td>一般企业</td> -->
<%--           </c:if> --%>
		  <td><gw:lookups category="${lookups_QYLX}" lookupsCode="${bean.funcclassify}"/></td>
          <td>${bean.Atimes}</td>
          <td>${bean.Acount}</td>
          <td><fmt:formatNumber pattern="0" value="${bean.Amoney}"></fmt:formatNumber></td>
          <td>${bean.Btimes}</td>
          <td><fmt:formatNumber pattern="0" value="${bean.Bmoney}"></fmt:formatNumber></td>
          <td><fmt:formatNumber pattern="0" value="${bean.totalMoney}"></fmt:formatNumber></td>
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
	  init_page();
  });
  
  function init_page(){
	  $("#txt_startTime").val("${startTime}");
	  $("#txt_endTime").val("${endTime}");
	  
	  $("#txt_unitname").val("${unitname}");
  }
  

  function boundTime(item){
	  $(item).bind('click', WdatePicker);
  }
  function doSearch(){
	  var stime=$("#txt_startTime").val();
	  var etime=$("#txt_endTime").val();
	  var name=$("#txt_unitname").val();
	  //msg(name);
	  window.location.href=base+'/statistics/corpstastic/list.htm?startTime='+stime+'&endTime='+etime+'&unitname='+name;
  }
  
</script>

</body>
</html>
