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
  <div class="right clearfix">
    <!--bread_crumbs start-->
    <c:import url="../../../include/navigation.jsp"/>
    <!--bread_crumbs end-->
    <!--bt start-->
    <!--bt end-->
    <!--tit start-->
    <!--tit start-->
    <form:form action="save.htm" method="post" modelAttribute="bean" id="form">
      <c:import url="../../../include/pageParams.jsp"/>
      <!--list start-->
      <a href="javascript:void(0);" class="table_head">>>长宁区科技创新券申请信息<span onclick="movePanel('panel1')"></span></a>
      <table id="tableInfo" border="0" cellspacing="0" cellpadding="0" class="table_list t_hs"> 
      		<tr>
      			<td width="10%" class="td1" rowspan="3">申请创新券种类</td>
      			<td width="5%" class="td2" rowspan="2"><input type="checkbox" id="a_check"/>A券</td>
      			<td width="10%" class="td1">申请数量</td>
      			<td width="15%" class="td2"><form:input path="amount" cssClass="input_txt w_209"/></td>
      			<td width="10%" class="td1">会议名称</td>
      			<td width="20%" class="td2"><form:input path="meetingName" cssClass="input_txt w_209"/></td>
      		</tr>
      		<tr>
      			<td class="td1">会议时间</td>
      			<td class="td2"><form:input path="startDate" cssClass="input_txt w_109"/>
					<form:select path="timeperiod" disabled="true">
						<form:option value="" label="--请选择--"/>
						<c:forEach items="${lookups_SJDGL}" var="item">
							<form:option value="${item.lCode}">${item.lName}</form:option>
						</c:forEach>
					</form:select>
				</td>
      			<td class="td1">申请会议场地名称</td>
      			<td class="td2"><form:input path="siteName" cssClass="input_txt w_209"/></td>
      		</tr>
      		<tr>
      			<td class="td2"><input type="checkbox" id="b_check"/>B券</td>
      			<td class="td2" colspan="4"></td>
      		</tr>
      		<tr>
      			<td class="td1">申请用途</td>
      			<td class="td2" colspan="5"><form:textarea path="purpose" cssClass="input_txt w_690" cols="80" rows="4"/></td>
      		</tr>
      		<tr>
      			<td class="td1">活动性质</td>
      			<td class="td2" colspan="3">
      				<form:checkboxes path="supportType" items="${lookups_ZCTJ}" itemLabel="lName" itemValue="lCode"/>
      			</td>
      			<td class="td1">支持部门</td>
      			<td class="td2">
      				<form:input path="supportBy" cssClass="input_txt w_209"/>
      			</td>
      		</tr>
      		<tr>
      			<td class="td1">活动内容简述(200字以内)</td>
      			<td class="td2" colspan="5"><form:textarea path="description" cssClass="input_txt w_690" cols="80" rows="4"/></td>
      		</tr>
      </table>
      
      <a style="margin-top: 15px;" href="javascript:void(0);" class="table_head">>>科技券办理记录<span onclick="movePanel('panel1')"></span></a>
      <table class="table_01">
      <tr>
      	<th width="10%">操作时间</th>
      	<th width="10%">操作人</th>
      	<th width="10%">操作结果</th>
      	<th width="10%">操作意见</th>
      </tr>
      
      <c:forEach items="${acList}" var="aclist" varStatus="i">
      	<tr>
	      	<td><fmt:formatDate value="${aclist.updateTime}" pattern="yyyy-MM-dd" /></td>
	      	<td>${aclist.operateUserName}</td>
	      	<td><gw:lookups category="${lookups_LZZT}" lookupsCode="${aclist.status}"/></td>
	      	<td>${aclist.opinion}</td>
      	</tr>
      </c:forEach>
      </table>
      
      
      <div class="an">
        <button type="button" onclick="doSubmit();" class="ico_tmpSave">
          <fmt:message key="sys.title.save"/></button>
        <button type="button" onclick="history.back();" class="ico_return">
          <fmt:message key="sys.title.return"/></button>
      </div>
    </form:form>
    </div>
  </div>
  <!--right end-->
<!--main end-->
<!--footer start-->
<c:import url="../../../include/footer.jsp"/>
<!--footer end-->
<script>
  function initPage(){
	  var type="${bean.type}";
	  if(type=="AKJQ"){
		  $("#a_check").attr("checked",'true');
		  $("#tableInfo tr:last").prev().hide();
		  $("#tableInfo tr:last").hide();
	  }
	  else{
		  $("#b_check").attr("checked",'true');
	  }
  }
  $(function(){
	 initPage(); 
  });
</script>
</body>
</html>
