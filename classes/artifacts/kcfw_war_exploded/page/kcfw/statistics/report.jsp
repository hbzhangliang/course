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
		  <td width="12%" class="td1"><b>会议名称</b></td>
          <td width="38%" class="td2"><form:input path="params[meetingname]" cssClass="input_txt w_209"/></td>
           <td width="12%" class="td1"><b>科技券种类</b></td>
          <td width="38%" class="td2">
          	<form:select path="params[type]" cssClass="input_txt w_209">
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
          <td width="12%" class="td1"><b>会议时间</b></td>
          <td width="38%" class="td2">
          		<form:input path="params[startDate1]" cssClass="input_txt w_92"/>到
              <form:input path="params[startDate2]" cssClass="input_txt w_92"/>
          </td>
        </tr>
        <tr>
        <td width="12%" class="td1"><b>会场</b></td>
          <td width="38%" class="td2" colspan="3">
          	会场提供商：<form:select path="params[provider.id]" items="${providerMap}" cssClass="input_txt w_209" onchange="getChilSites(this)"/>
          
          	会场：<form:select path="params[sitenames]" cssClass="input_txt w_209"> 
					
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
    	<button id="btnPrintExcl" type="button" class="ico_print">打印</button>
    	</c:if>
    </div>
    <!--bt end-->
    <gw:pagination mode="biz"/>
    <!--table start-->
    <table class="table_01">
      <tr>
        <th width="5%"><input type="checkbox" id="selectAll" title="<fmt:message key="sys.title.selectAll"/>"/></th>
        <th width="5%" class="orderBy">券种</th>
        <th width="10%" class="orderBy">流水号</th>
        <th width="10%">会场提供商</th>
        <th width="10%">会场名称</th>
        <th width="8%" class="orderBy">会议时间</th>
        <th width="15%" class="orderBy">会议名称</th>
        <th width="10%" class="orderBy">科技券数量</th>
        <th width="10%" class="orderBy">流转状态</th>
        <th width="12%"><fmt:message key="biz.title.operation"/></th>
      </tr>
      <c:forEach items="${list}" var="bean" varStatus="i">
        <tr id="tr_${bean.id}">
          <td><input class="chk" type="checkbox" id="chk_${bean.id}"/></td>
          <td><gw:lookups category="${lookups_KJLX}" lookupsCode="${bean.type}"/></td>
          <td>${bean.seq}</td>
          <td>${bean.provider.name}</td>
          <td>${bean.sitenames}</td>
          <td><fmt:formatDate value="${bean.startDate}" pattern="yyyy-MM-dd" /></td>
          <td><a onclick="doTitleView(this)">${bean.meetingname}</a></td>
          <td>${bean.amount}</td>
          <td><gw:lookups category="${lookups_LZZT}" lookupsCode="${bean.status}"/></td>
          <td>
             <div>
              <a href="javascript:void(0)" onclick="doView(this)">
                <fmt:message key="sys.title.view"/>
              </a>
              <c:if test="${isCom}">
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
  var orderByList = ["type","seq","startDate","meetingName","amount","status"];

  function doPrint(item){
	  var couponId=$(item).closest('tr').attr('id').substr(3);
	  if("A券"==$(item).closest('tr').find('td').eq(1).text()){
		  window.location.href=base+'/couponMng/couponA/print.htm?id='+couponId;
	  }
	  else{
		  window.location.href=base+'/couponMng/couponB/print.htm?id='+couponId;
	  }
  }
  
  $(function(){
	$("#btnPrintExcl").click(function(){
		$("#searchForm").attr("action","printExcel.htm");
 		$("#searchForm").submit();
 		$("#searchForm").attr("action","list.htm");
	});
	getSiteList("");
  })
  
  
  function getChilSites(item){
	var index = item.selectedIndex;
	var value = item.options[index].value;
	getSiteList(value);
  }
  
  function getSiteList(id){
	  var name="${queryBean.params['sitenames']}";
	  $.post(base + '/siteInfo/getSiteList.htm', {providerId:id}, function (data) {
			var str="<option value='' label='---全部---'/>";
			$("#paramssitenames").html(str);
			$.each(data,function(idx,item){
				if(name.indexOf(item.name)>-1){
					str="<option value='"+item.name+"' label='"+item.name+"' selected='selected'/>";
				}
				else{
					str="<option value='"+item.name+"' label='"+item.name+"'/>";
				}
				$("#paramssitenames").append(str);
			});
		},'json');
  }
  
</script>

</body>
</html>
