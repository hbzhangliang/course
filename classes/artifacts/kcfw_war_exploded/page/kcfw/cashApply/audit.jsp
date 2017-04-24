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
		<gw:bizSearch fields="申请时间" path="applyDate"/>
    </div>
    <!--bt end-->
    <gw:pagination mode="biz"/>
    <!--table start-->
    <table class="table_01">
      <tr>
        <th width="5%"><input type="checkbox" id="selectAll" title="<fmt:message key="sys.title.selectAll"/>"/></th>
        <th width="8%" class="orderBy">科技券类型</th>
        <th width="10%" class="orderBy">申请单位名称</th>
        <th width="10%" class="orderBy">申请时间</th>
        <th width="10%" class="orderBy">科技券数量</th>
        <th width="10%" class="orderBy">科技券金额</th>
        <th width="10%" class="orderBy">申请状态</th>
        <th width="10%"><fmt:message key="biz.title.operation"/></th>
      </tr>
      <c:forEach items="${list}" var="bean" varStatus="i">
        <tr id="tr_${bean.id}">
          <td><input class="chk" type="checkbox" id="chk_${bean.id}"/></td>
          <td><gw:lookups category="${lookups_KJLX}" lookupsCode="${bean.type}"/></td>
          <td>${bean.name}</td>
          <td><fmt:formatDate value="${bean.applyDate}" pattern="yyyy-MM-dd" /></td>
          <td>${bean.amount}</td>
          <td>
          	<fmt:formatNumber pattern="0" value="${bean.cost}"></fmt:formatNumber>
          </td>
          <td><gw:lookups category="${lookups_JSZT}" lookupsCode="${bean.status}"/></td>
          <td>
             <div>
             <c:if test="${bean.status eq 'settle'}">
              <a href="javascript:void(0)" onclick="doInput(this)">
             	结算
              </a>
              </c:if>
              <c:if test="${bean.status eq 'settled'}">
              <a href="javascript:void(0)" onclick="doView(this)">
                <fmt:message key="sys.title.view"/>
              </a>
              </c:if>
              <a href="javascript:void(0)" onclick="doPrint(this)">
               	 打印
              </a>
            </div>
          </td>
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
  //var orderByList = ["seq","meetingName","amount","startDate","status"];

  function doPrint(item){
	  var cashapplyId=$(item).closest('tr').attr('id').substr(3);
	  window.location.href=base+'/couponMng/feeApprove/print.htm?id='+cashapplyId;
  }
  
  
  function doAudit(item){
	  if($.trim($(item).closest('tr').find('td:eq(1)').text())=="B券"){
		  $.messager.defaults = { ok: "确定", cancel: "取消",width:'300px',height:'180px'};
		  $.messager.prompt("操作提示", "请输入要拨付的金额？", function (money) {  
			  if(!isNaN(money)){
				  var cashapplyId=$(item).closest('tr').attr('id').substr(3);
				  $.post(base + '/couponMng/feeApprove/audit.htm', {id:cashapplyId,cost:money}, function (data) {
	 	       		  if(data=="Success"){
	 	       			  msg("已成功拨付");
	 	       		  }
	 	       		  else{
	 	       			  msg(data); 
	 	       		  }
	 	       		  setTimeout(function(){
	 	       			  window.location.href=base+'/couponMng/feeApprove/list.htm';
	 	       		  },500)
	 	       	  });
			  }
			  else{
				  msg("请输入数字金额");
				  return;
			  }
	      }); 
	  }
	  else{
		  $.messager.defaults = { ok: "拨付", cancel: "取消",width:'300px',height:'180px'};
	 	  $.messager.confirm("操作提示", "拨付结果？", function (flag) {
	 		  if(flag){
	 	       	  var cashapplyId=$(item).closest('tr').attr('id').substr(3);
	 	       	  if($.trim($(item).closest('tr').find('td:eq(1)').text())=="B券"){
	 	       		  alert("good");
	 	       		  return;
	 	       	  }
	 	       	  return;
	 	       	  $.post(base + '/couponMng/feeApprove/audit.htm', {id:cashapplyId,cost:0}, function (data) {
	 	       		  if(data=="Success"){
	 	       			  msg("已成功拨付");
	 	       		  }
	 	       		  else{
	 	       			  msg(data); 
	 	       		  }
	 	       		  setTimeout(function(){
	 	       			  window.location.href=base+'/couponMng/feeApprove/list.htm';
	 	       		  },500)
	 	       	  });
	 		  }
	       });
		  
	  }
	  
  }
  
  $(function(){
	  
  })
</script>

</body>
</html>
