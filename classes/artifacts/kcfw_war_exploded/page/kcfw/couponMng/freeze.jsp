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
		  <td width="12%" class="td1"><b>科技券种类</b></td>
          <td width="38%" class="td2">
				<form:select path="params[eq_type]" cssClass="input_txt w_209">
          			<form:option value="" label="---全部---"/>
          			<form:options items="${lookups_KJLX}" itemLabel="lName" itemValue="lCode"/>
          		</form:select>
		</td>
        </tr>
        <tr>
		  <td width="12%" class="td1"><b>流转状态</b></td>
          <td width="38%" class="td2">
          	<form:select path="params[eq_status]" cssClass="input_txt w_209">
          			<form:option value="" label="---全部---"/>
          			<form:options items="${lookups_LZZT}" itemLabel="lName" itemValue="lCode"/>
          		</form:select>
          </td>
          <td width="12%" class="td1"><b>企业状态</b></td>
          <td width="38%" class="td2">
          	<form:select path="params[corp.status]" cssClass="input_txt w_209">
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


    </div>
    <!--bt end-->
    <gw:pagination mode="biz"/>
    <!--table start-->
    <table class="table_01">
      <tr>
        <th width="5%"><input type="checkbox" id="selectAll" title="<fmt:message key="sys.title.selectAll"/>"/></th>
        <th width="10%" class="orderBy">流水号</th>
        <th width="10%" class="orderBy">企业名称</th>
         <th width="10%" class="orderBy">券种</th>
        <th width="15%">申请用途</th>
        <th width="10%" class="orderBy">流转状态</th>
        <th width="10%" class="orderBy">申请时间</th>
        <th width="10%" class="orderBy">企业状态</th>
        <th width="8%"><fmt:message key="biz.title.operation"/></th>
      </tr>
      <c:forEach items="${list}" var="bean" varStatus="i">
        <tr id="tr_${bean.id}">
          <td><input class="chk" type="checkbox" id="chk_${bean.id}"/></td>
          <td>${bean.seq}</td>
          <td>${bean.corp.unitName}</td>
          <td><gw:lookups category="${lookups_KJLX}" lookupsCode="${bean.type}"/></td>
          <td>${bean.purpose}</td>
          <td><gw:lookups category="${lookups_LZZT}" lookupsCode="${bean.status}"/></td>
          <td><fmt:formatDate value="${bean.applydate}" pattern="yyyy-MM-dd" /></td>
          <td><gw:lookups category="${lookups_QYZT}" lookupsCode="${bean.corp.status}"/></td>
          <td>
             <div>
              <c:if test="${bean.corp.status eq 'frozen'}">
	              <a style="color: green;" href="javascript:void(0)" onclick="doFreeze(this,'false')">
	                解冻
	              </a>
              </c:if>
              <c:if test="${bean.corp.status eq 'activated'}">
	              <a style="color: red;" href="javascript:void(0)" onclick="doFreeze(this,'true')">
	                冻结
	              </a>
              </c:if>
              <a href="javascript:void(0)" onclick="doView(this)">
                <fmt:message key="sys.title.view"/>
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
  var orderByList = ["seq","corp.unitName","type","status","applydate"];
  
  function doFreeze(item,flag){
	  var strInfo1=flag=='true'?"冻结":"解冻";
	  var strInfo2=flag=='true'?"是否执行冻结操作":"是否执行解冻操作";
	  var strInfo3=flag=='true'?"冻结成功":"解冻成功";
	  $.messager.defaults = { ok: strInfo1, cancel: "取消",width:'300px',height:'180px'};
	  $.messager.confirm("操作提示", strInfo2, function (event) {
		  if(event){
	       	  var couponId=$(item).closest('tr').attr('id').substr(3);
	       	  $.post(base + '/couponMng/freeze/freeze.htm', {id:couponId,flag:flag}, function (data) {
	       		  if(data=="Success"){
	       			  msg(strInfo3);
	       		  }
	       		  else{
	       			  msg('出现错误!'); 
	       		  }
	       		  setTimeout(function(){
	       			  window.location.href=base+'/couponMng/freeze/list.htm';
	       		  },500)
	       	  });
		  }
      });
  }
  
</script>

</body>
</html>
