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
		  <td width="12%" class="td1"><b>流转状态</b></td>
         <td width="38%" class="td2">
          	<form:select path="params[eq_status]" cssClass="input_txt w_209">
          		<form:option value="" label="---全部---"/>
          		<form:options items="${lookups_LZZT}" itemLabel="lName" itemValue="lCode"/>
          	</form:select>
          </td>
        </tr>
        <tr>
		  <td width="12%" class="td1"><b>会议序号</b></td>
          <td width="38%" class="td2">
          	<form:input path="params[meetingnumber]" cssClass="input_txt w_209"/>
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
    </div>
    <!--bt end-->
    <gw:pagination mode="biz"/>
    <!--table start-->
    <table class="table_01">
      <tr>
        <th width="5%"><input type="checkbox" id="selectAll" title="<fmt:message key="sys.title.selectAll"/>"/></th>
        <th width="10%" class="orderBy">流水号</th>
        <th width="10%" class="orderBy">会议序号</th>
        <th width="20%" class="orderBy">会议名称</th>
        <th width="10%">会场名称</th>
        <th width="10%" class="orderBy">科技券数量</th>
        <th width="10%" class="orderBy">会议时间</th>
        <th width="10%" class="orderBy">流转状态</th>
        <th width="8%"><fmt:message key="biz.title.operation"/></th>
      </tr>
      <c:forEach items="${list}" var="bean" varStatus="i">
        <tr id="tr_${bean.id}">
          <td><input class="chk" type="checkbox" id="chk_${bean.id}"/></td>
          <td>${bean.seq}</td>
          <td>${bean.meetingnumber}</td>
          <td><a onclick="doTitleView(this)">${bean.meetingname}</a></td>
          <td>${bean.sitenames}</td>
          <td>${bean.amount}</td>
          <td><fmt:formatDate value="${bean.startDate}" pattern="yyyy-MM-dd" /></td>
          <td><gw:lookups category="${lookups_LZZT}" lookupsCode="${bean.status}"/></td>
          <td>
             <div>
              <a href="javascript:void(0)" onclick="doView(this)">
                <fmt:message key="sys.title.view"/>
              </a>
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

  $(function(){
	  
  })
  
  function doConfirm(item){
	  doInput(item,"");
  }
  
  function doPrint(item){
	  var couponId=$(item).closest('tr').attr('id').substr(3);
	  window.location.href=base+'/couponMng/couponA/print.htm?id='+couponId;
  }
  
</script>

</body>
</html>
