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
          <td width="12%" class="td1"><b>申请用途</b></td>
          <td width="38%" class="td2"><form:input path="params[purpose]" cssClass="input_txt w_209"/></td>
		  <td width="12%" class="td1"><b>支持情况</b></td>
          <td width="38%" class="td2">
				<form:select path="params[eq_supportType]" cssClass="input_txt w_209">
          			<form:option value="" label="---全部---"/>
          			<form:options items="${lookups_ZCTJ}" itemLabel="lName" itemValue="lCode"/>
          		</form:select>
		</td>
        </tr>
        <tr>
		  <td width="12%" class="td1"><b>支持单位</b></td>
          <td width="38%" class="td2" colspan="3">
          	<form:input path="params[supportBy]" cssClass="input_txt w_209"/>
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
         <th width="15%">申请用途</th>
        <th width="10%" class="orderBy">支持情况</th>
        <th width="10%" class="orderBy">支持单位</th>
        <th width="10%" class="orderBy">联系人</th>
        <th width="10%" >联系电话</th>
        <th width="10%" >申请时间</th>
        <th width="14%"><fmt:message key="biz.title.operation"/></th>
      </tr>
      <c:forEach items="${list}" var="bean" varStatus="i">
        <tr id="tr_${bean.id}">
          <td><input class="chk" type="checkbox" id="chk_${bean.id}"/></td>
          <td>${bean.seq}</td>
          <td>${bean.corp.unitName}</td>
          <td>${bean.purpose}</td>
          <td><gw:lookups category="${lookups_ZCTJ}" lookupsCode="${bean.supportType}"/></td>
          <td>${bean.supportBy}</td>
          <td>${bean.supportContactor}</td>
          <td>${bean.supportTel}</td>
          <td><fmt:formatDate value="${bean.applydate}" pattern="yyyy-MM-dd" /></td>
          <td>
             <div>
              <a href="javascript:void(0)" onclick="doInput(this)">
	             	备案
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
  var orderByList = ["seq","corp.unitName","supportType","supportBy","supportContactor"];

  
  
</script>

</body>
</html>
