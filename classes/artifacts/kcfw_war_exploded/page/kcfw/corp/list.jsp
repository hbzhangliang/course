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
    
<form:form action="${act==null?'list':act}.htm" method="post" modelAttribute="queryBean" id="searchForm">
  <form:hidden path="pm.page"/>
  <form:hidden path="pm.totalRows"/>
  <form:hidden path="pm.pageSize"/>
  <form:hidden path="pm.totalPage"/>
  <form:hidden path="id"/>
  <form:hidden path="op"/>
  <form:hidden path="orderBy"/>
  <div id="searchBar" class="searchBar">
    <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
        <tr>
		  <td width="12%" class="td1"><b>企业名称</b></td>
          <td width="38%" class="td2"><form:input path="params[unitName]" cssClass="input_txt w_209"/></td>
          <td width="12%" class="td1"><b>单位性质</b></td>
          <td width="38%" class="td2">
          	<form:select path="params[eq_type]" cssClass="input_txt w_209">
          		<form:option value="" label="---全部---"/>
          		<form:options items="${lookups_DWXZ}" itemLabel="lName" itemValue="lCode"/>
          	</form:select>
          </td>
        </tr>
        
        <tr>
		  <td width="12%" class="td1"><b>产业领域</b></td>
           <td width="38%" class="td2">
          	<form:select path="params[eq_industry]" cssClass="input_txt w_209">
          		<form:option value="" label="---全部---"/>
          		<form:options items="${lookups_CYLY}" itemLabel="lName" itemValue="lCode"/>
          	</form:select>
          </td>
          <td width="12%" class="td1"><b>企业性质认定</b></td>
          <td width="38%" class="td2">
          	<form:select path="params[eq_funcClassify]" cssClass="input_txt w_209">
          		<form:option value="" label="---全部---"/>
          		<form:options items="${lookups_QYLX}" itemLabel="lName" itemValue="lCode"/>
          	</form:select>
          </td>
        </tr>
        
        <tr>
          <td width="12%" class="td1"><b>审批情况</b></td>
          <td width="38%" class="td2" colspan="3">
          		<form:select path="params[eq_status]" cssClass="input_txt w_209">
	          		<form:option value="" label="---全部---"/>
	          		<form:options items="${lookups_QYZT}" itemLabel="lName" itemValue="lCode"/>
          		</form:select>
          </td>
        </tr>
      <tr>
        <td class="td1"></td>
        <td class="td2" colspan="3">
          <button onclick="$('#searchForm').submit();" type="button" class="ico_search"><fmt:message key="sys.title.search"/></button>
        </td>
      </tr>
    </table>
  </div>
</form:form>
		
      <c:if test="${isCom}">
      <button onclick="doPrintExcel();" type="button" class="ico_print">打印</button>
      </c:if>
    </div>
    <!--bt end-->
    <gw:pagination mode="biz"/>
    <!--table start-->
    <table class="table_01">
      <tr>
        <th class="orderBy">企业名称</th>
        <th width="12%" class="orderBy">单位性质</th>
        <th width="10%" class="orderBy">产业领域</th>
        <th width="10%" class="orderBy">企业认定情况</th>
        <th width="15%" class="orderBy">企业性质认定</th>
        <th width="10%" class="orderBy">系统注册时间</th>
        <th width="8%" class="orderBy">审批情况</th>
        <th width="16%"><fmt:message key="biz.title.operation"/></th>
      </tr>
      <c:forEach items="${list}" var="bean" varStatus="i">
        <tr id="tr_${bean.id}">
          <td>${bean.unitName}</td>
          <td><gw:lookups category="${lookups_DWXZ}" lookupsCode="${bean.type}"/></td>
          <td><gw:lookups category="${lookups_CYLY}" lookupsCode="${bean.industry}"/></td>
          <td><gw:lookups category="${lookups_RDQK}" lookupsCode="${bean.level}"/></td>
          <td>
         	 <gw:lookups category="${lookups_QYLX}" lookupsCode="${bean.funcClassify}"/>
<%--           	<gw:lookups booleanValue="${bean.isFunc}" mode="YESNO"/> --%>
          </td>
          <td><fmt:formatDate value="${bean.regDate}" pattern="yyyy-MM-dd"/></td>
          <td>
          	<gw:lookups category="${lookups_QYZT}" lookupsCode="${bean.status}"/>
          </td>
          <td>
          	<div>
	          <c:if test="${bean.status eq 'reg'&&((isCom)||(isInfo&&!(bean.funcClassify eq 'orgUser')))}">
	              <a href="javascript:void(0)" onclick="doApprove(this)">
	               	 审批
	              </a>
	          </c:if>
	          <c:if test="${isCom||isInfo}">
	          	  <a href="javascript:void(0)" onclick="doInput(this)">
			         	修改
			     </a>
                  <a href="javascript:void(0)" onclick="doDelete(this)">
                      删除
                  </a>
			     <a href="javascript:void(0)" onclick="doPrint(this)">
			         	打印
			     </a>
		     </c:if>
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
	function doApprove(item){
		$.messager.defaults = { ok: "通过", cancel: "不通过",width:'300px',height:'150px'};
		$.messager.confirm('提示:','请确认企业审批结果?',function(flag){ 
			var corpId=$(item).closest('tr').attr('id').substring(3);
	       	  $.post(base + '/corp/approve.htm', {id:corpId,flag:flag}, function (data) {
	       		  msg(data);
	       		  setTimeout(function(){
	       			  window.location.href=base+'/corp/list.htm';
	       		  },800)
	       	  });
		 }); 
		
	}

    function doDelete(item){
        $.messager.defaults = { ok: "删除", cancel: "取消",width:'300px',height:'150px'};
        $.messager.confirm('提示:','确认要删除企业?',function(flag){
            if(flag) {
                var corpId = $(item).closest('tr').attr('id').substring(3);
                $.post(base + '/corp/deleteCorp.htm', {id: corpId}, function (data) {
                    msg(data);
                    setTimeout(function () {
                        window.location.href = base + '/corp/list.htm';
                    }, 800)
                });
            }

        });
    }

	function doPrint(item){
		var corpId=$(item).closest('tr').attr('id').substr(3);
		//msg(corpId);
		window.location.href=base+'/corp/printCorp.htm?id='+corpId;
	}
	
	function doPrintExcel(){
		//window.location.href=base+'/corp/printCorpXls.htm';
		$("#searchForm").attr("action","printCorpXls.htm");
 		$("#searchForm").submit();
 		$("#searchForm").attr("action","list.htm");
		
	}
	
</script>
</body>
</html>
