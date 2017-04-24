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
          <td width="12%" class="td1"><b>流水号</b></td>
          <td width="38%" class="td2"><form:input path="params[seq]" cssClass="input_txt w_209"/></td>
		  <td width="12%" class="td1"><b>会议名称</b></td>
          <td width="38%" class="td2"><form:input path="params[meetingName]" cssClass="input_txt w_209"/></td>
        </tr>
        <tr>
		  <td width="12%" class="td1"><b>流转状态</b></td>
          <td width="38%" class="td2">
          	<form:select path="params[eq_flowStatus]" cssClass="input_txt w_209">
          		<form:option value="" label="---全部---"/>
          		<form:options items="${lookups_ALZT}" itemLabel="lName" itemValue="lCode"/>
          	</form:select>
          </td>
          <td width="12%" class="td1"><b>会议时间</b></td>
          <td width="38%" class="td2">
          		<form:input path="params[startDate1]" cssClass="input_txt w_92"/>到
              <form:input path="params[startDate2]" cssClass="input_txt w_92"/>
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
    	
    	<button id="btnApply" type="button" class="ico_send">申请</button>
    </div>
    <!--bt end-->
    <gw:pagination mode="biz"/>
    <!--table start-->
    <table class="table_01">
      <tr>
        <th width="5%"><input type="checkbox" id="selectAll" title="<fmt:message key="sys.title.selectAll"/>"/></th>
        <th width="10%" class="orderBy">流水号</th>
        <th width="20%" class="orderBy">会议名称</th>
        <th width="10%">会场名称</th>
        <th width="10%" class="orderBy">科技券数量</th>
        <th width="10%" class="orderBy">会议时间</th>
        <th width="10%" class="orderBy">流转状态</th>
        <th width="12%"><fmt:message key="biz.title.operation"/></th>
      </tr>
      <c:forEach items="${list}" var="bean" varStatus="i">
        <tr id="tr_${bean.id}">
          <td><input class="chk" type="checkbox" id="chk_${bean.id}"/></td>
          <td>${bean.seq}</td>
          <td><a onclick="doTitleView(this)">${bean.meetingName}</a></td>
          <td>${bean.siteName}</td>
          <td>${bean.amount}</td>
          <td><fmt:formatDate value="${bean.startDate}" pattern="yyyy-MM-dd" /></td>
          <td><gw:lookups category="${lookups_ALZT}" lookupsCode="${bean.flowStatus}"/></td>
          <td>
             <div>
              <c:if test="${bean.status eq 'store'}">
	              <a href="javascript:void(0)" onclick="doInput(this)">
	                <fmt:message key="sys.title.edit"/>
	              </a>
              </c:if>
              <a href="javascript:void(0)" onclick="doView(this)">
                <fmt:message key="sys.title.view"/>
              </a>
              <c:if test="${bean.status eq 'comfirm'}">
	              <a href="javascript:void(0)" onclick="doUse(this)">
	             	使用
	              </a>
              </c:if>
              <a href="javascript:void(0)" onclick="doPrint(this)">
               	 打印
              </a>
              <c:if test="${bean.status eq 'store'}">
	              <a href="javascript:void(0)" onclick="doDel(this)">
	               	 删除
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
  var orderByList = ["seq","meetingName","amount","startDate","status"];

  $(function(){
		$("#btnApply").click(function(){
			var status="${corp.status}";
			if("frozen"==status){
				msg("企业被冻结，不能申请科技券");
				return ;
			}
            if(${!flag}){
                msg("今年A券额度已用完，请明年再申请");
                return;
            }
			//$("#searchForm").attr("action","coupona_Apply.htm");
			$("#searchForm").attr("action","input.htm");
	 		$("#searchForm").submit();
	 		$("#searchForm").attr("action","list.htm");
		});
  })
  
  function doUse(item){
	  $.messager.defaults = { ok: "使用", cancel: "取消",width:'300px',height:'150px'};
	  $.messager.confirm('提示:','你确认要使用此科技券吗?',function(event){ 
		  if(event){ 
		  	var couponId=$(item).closest('tr').attr('id').substr(3);
		  	$.post(base + '/couponMng/couponA/use.htm', {id:couponId}, function (data) {
		  		if(data=="Success"){
		  			msg('已更新状态,使用成功!');
		  		}
		  		else{
		  			msg('更新状态错误,使用失败!');
		  		}
		  		setTimeout(function(){
		  			 window.location.href=base+'/couponMng/couponA/list.htm';
		  		},1500);
		  	});
		  }
	   }); 
  }
  
  function doPrint(item){
	  var couponId=$(item).closest('tr').attr('id').substr(3);
	  window.location.href=base+'/couponMng/couponA/print.htm?id='+couponId;
  }
  
</script>

</body>
</html>
