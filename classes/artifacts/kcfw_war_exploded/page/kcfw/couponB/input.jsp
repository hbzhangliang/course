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
      <c:import url="../../../include/businessEntityParams.jsp"/>
      <!--list start-->
      <a href="javascript:void(0);" class="table_head">>>长宁区科技创新券B券申请信息<span onclick="movePanel('panel1')"></span></a>
      <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
      	<tr>
      		<td class="td1" width="15%"><b>单位名称</b></td>
          	<td class="td2" width="30%"><form:label path="corp.unitName" id="corp_unitName" cssClass="w_209">${currentUser.depart.name}</form:label></td>
          	<td class="td1" width="15%"><b>法人代表</b></td>
	        <td class="td2" width="30%">
	           <form:label path="corp.representative" id="corp_representative" cssClass="w_209">${corp.representative}</form:label>
	        </td>
      	</tr>
      	<tr>
      		<td class="td1"><b>企业身份代码</b></td>
          	<td class="td2" colspan="3">
          		<c:if test="${corp.isUnionCard}">
          			<div>统一社会信用代码:<form:label path="corp.creditCode" cssClass="w_209">${corp.creditCode }</form:label></div>
          		</c:if>
          		<c:if test="${!corp.isUnionCard}">
	          		<div>组织机构代码:<form:label path="corp.orgCode" cssClass="w_109">${corp.orgCode}</form:label>
	          		营业执照注册号:<form:label path="corp.license" cssClass="w_109">${corp.license}</form:label>
	          		税务登记证号:<form:label path="corp.taxLicense" cssClass="w_109">${corp.taxLicense}</form:label>
	          		</div>
          		</c:if>
			</td>
      	</tr>
      	 <tr>
          <td class="td1"><b>注册地址</b></td>
          <td class="td2" colspan="3"><form:label path="corp.registerAddress" cssClass="w_690">${corp.registerAddress}</form:label></td>
        </tr>
         <tr>
          <td class="td1"><b>办公地址</b></td>
          <td class="td2" colspan="3"><form:label path="corp.contactAddress" cssClass="w_440">${corp.contactAddress}</form:label>
          	邮编:<form:label path="corp.postcode" cssClass="w_109" readonly="true">${corp.postcode}</form:label>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>工商注册时间</b></td>
          <td class="td2" colspan="3">
         	 <fmt:formatDate value="${corp.applyDate}" pattern="yyyy-MM-dd" var="corp_applyDate"/>
            <form:label path="corp.applyDate" cssClass="w_209">${corp_applyDate}</form:label>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>联系人姓名</b></td>
          <td class="td2">
          	<form:label path="corp.contact" cssClass="w_209">${corp.contact}</form:label>
          </td>
          <td class="td1"><b>联系人电话</b></td>
          <td class="td2"><form:label path="corp.tel" cssClass="w_209">${corp.tel}</form:label></td>
        </tr>
        <tr>
          <td class="td1"><b>注册资金</b></td>
          <fmt:formatNumber value="${corp.capital}" pattern="0" var="corp_capital"/>
          <td class="td2"><form:label path="corp.capital" cssClass="w_209">${corp_capital}</form:label>万元</td>
          <td class="td1"><b>上年度从业人数</b></td>
          <td class="td2">
            <form:label path="corp.previousPersonals" cssClass="w_209">${corp.previousPersonals }人</form:label>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>上年度销售额</b></td>
          <fmt:formatNumber value="${corp.previousSales}" pattern="0" var="corp_previousSales"/>
          <td class="td2"><form:label path="corp.previousSales" cssClass="w_209">${corp_previousSales}万元</form:label></td>
          <td class="td1"><b>上年度企业净资产</b></td>
          <td class="td2">
         	 <fmt:formatNumber value="${corp.previousAsset}" pattern="0" var="corp_previousAsset"/>
            <form:label path="corp.previousAsset" cssClass="w_209">${corp_previousAsset}万元</form:label>
          </td>
        </tr>
        <tr>
      		<td class="td1"><b>上年度税收总额</b></td>
      		<fmt:formatNumber value="${corp.previousRevenue}" pattern="0" var="corp_previousRevenue"/>
          	<td class="td2" colspan='1'><form:label path="corp.previousRevenue" cssClass="w_209">${corp_previousRevenue}万元</form:label></td>
          	<td class="td1"><b>本年度税收</b></td>
      		<fmt:formatNumber value="${corp.revenue}" pattern="0" var="corp_Revenue"/>
      		<td class="td2" colspan='1'><form:label path="corp.revenue" cssClass="w_209">${corp_Revenue}万元</form:label></td>
      	</tr>
      	<tr>
        	<td class="td1"><b>所属园区</b></td>
        	<td class="td2" colspan='1'>  		
        		<form:label path="corp.park">${corp.park}</form:label>
        	</td>
        	<td class="td1"><b>公司网址</b></td>
        	<td class="td2" colspan='1'>  		
        		<form:label path="corp.park">${corp.network}</form:label>
        	</td>
        </tr>
        <tr>
        	<td class="td1"><b>单位性质</b></td>
        	<td class="td2" colspan='3'>
        		<form:checkboxes path="corp.type" items="${lookups_DWXZ}" itemLabel="lName" itemValue="lCode" disabled="true"/>
        		<form:label path="corp.typeOther">${corp.typeOther}</form:label>
        	</td>
        </tr>
        <tr>
        	<td class="td1"><b>产业领域</b></td>
        	<td class="td2" colspan='3'>
        		<form:checkboxes path="corp.industry" items="${lookups_CYLY}" itemLabel="lName" itemValue="lCode" disabled="true"/>
        		<form:label path="corp.industryOther">${corp.industryOther}</form:label>
        	</td>
        </tr>
        <tr>
        	<td class="td1"><b>企业认定情况</b></td>
        	<td class="td2" colspan='3'>
        		<form:checkboxes path="corp.level" items="${lookups_RDQK}" itemLabel="lName" itemValue="lCode" disabled="true"/>
        		<form:input path="corp.levelOther"/>
        	</td>
        </tr>
         <tr>
          <td class="td1"><b>企业性质认定</b></td>
          <td class="td2" colspan="3">
            <form:radiobuttons path="corp.funcClassify" items="${lookups_QYLX}" itemLabel="lName" itemValue="lCode" readonly="true"/>
          </td>
        </tr>
        <c:if test="${bean.corp.funcClassify eq 'orgUser'}">
          <tr>
            <td class="td1"><b>功能性机构服务内容</b></td>
            <td class="td2" colspan="3">
              <form:radiobuttons path="corp.funcInfo" items="${lookups_FWJG}" itemLabel="lName" itemValue="lCode"
                                  readonly="true"/> 
              <c:if test="${bean.corp.funcInfo eq 'otherServ'}"> 
                 <form:input path="corp.funcOther" readonly="true" cssClass="input_txt w_209"/> 
              </c:if> 
            </td>
          </tr>
        </c:if>
        
         <tr>
          <td class="td1"><b>企业上市情况</b></td>
          <td class="td2" colspan="3">
            <form:radiobuttons path="corp.list_situation" items="${lookups_SSQK}" itemLabel="lName" itemValue="lCode" readonly="true"/>
          </td>
        </tr>
        
        <tr>
       	  <td class="td1"><b>申请单位简介</b></td>
          <td class="td2" colspan='3'><form:textarea path="corp.description" cols="96" rows="3" readonly="true"/></td>
        </tr> 
         <tr>
       	  <td class="td1"><b>近些年来业务开展情况</b></td>
          <td class="td2" colspan='3'><form:textarea path="corp.business_situation" cols="96" rows="3" readonly="true"/></td>
        </tr> 
        <tr>
       	  <td class="td1"><b>获得投融资情况</b></td>
          <td class="td2" colspan='3'><form:textarea path="corp.investment_situation" cols="96" rows="3" readonly="true"/></td>
        </tr> 
       </table>
       
        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
        <tr>
          <td width="15%" class="td1"><b>申请创新券种类</b></td>
          <td width="25%" class="td2">
          	<input type="checkbox" value="B券" checked="checked" onclick="return false"/>B券     	
          </td>
          <td width="50%" class="td2" colspan="4">
          		<label>(按实际发生费用的发票金额给予一定补贴)</label>
          </td>
        </tr>
        <tr>
       	  <td class="td1"><b>预算额度</b></td>
          <td class="td2" colspan='5'><form:input path="bBudgetMoney" cssClass="input_txt w_209"/></td>
        </tr>  
         <tr>
       	  <td class="td1"><b>申请用途</b></td>
          <td class="td2" colspan='5'><form:textarea path="purpose" cols="96" rows="3"/></td>
        </tr>  
        <tr>
       	  <td class="td1"><b>活动性质</b></td>
          <td class="td2" colspan='5'>
          	 <form:radiobuttons path="supportType" items="${lookups_ZCTJ}" itemLabel="lName" itemValue="lCode"/>
		  </td>
        </tr>  
        <tr>
       	  <td class="td1"><b>支持单位名称</b></td>
          <td class="td2">
          	 <form:input path="supportBy" cssClass="input_txt w_209"/>
		  </td>
		  <td class="td1"><b>联系人</b></td>
          <td class="td2">
          	 <form:input path="supportContactor" cssClass="input_txt w_109"/>
		  </td>
		  <td class="td1"><b>电话</b></td>
          <td class="td2">
          	 <form:input path="supportTel" cssClass="input_txt w_109"/>
		  </td>
        </tr>   
        <tr>
          <td class="td1"><b>证明材料</b><br/><label class='redcolor'>(可上传多个附件)</label></td>
          <td class="td2" colspan="5">
           名称：<input type="text" id="displayName" class="input_txt w_109"/>
            <gw:fileUpload objectId="${bean.id}" rename="true"/>
          </td>
        </tr>
        <tr>
       	  <td class="td1"><b>活动内容描述</b></td>
          <td class="td2" colspan='5'><form:textarea path="description" cols="96" rows="3"/></td>
        </tr>  
      </table>  
      <a style="margin-top: 15px;" href="javascript:void(0);" class="table_head">>>B券额度使用信息<span onclick="movePanel('panel1')"></span></a>
      <table id="corplimitInfo" class="table_list t_hs">
      	<tr>
      		<td width="12%" class="td1"><b>当前年份</b></td>
      		<td width="10%" class="td2"><label></label></td>
      		<td width="12%" class="td1">单位名称</td>
      		<td width="10%" class="td2"><label>${bean.corp.unitName}</label></td>
      		<td width="12%" class="td1"><b>总申请金额(元)</b></td>
      		<td width="10%" class="td2"><label></label></td>
      		<td width="12%" class="td1"><b>余额(元)</b></td>
      		<td width="10%" class="td2"><label></label></td>
      	</tr>
      </table>
      
      
      <c:if test="${bean.op eq 'v'}">
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
      </c:if>
      
      
      <div class="an">
        <button type="button" onclick="doAction('save')" class="ico_tmpSave">
          暂存</button>
          <button type="button" onclick="doAction('send')" class="ico_send">
          提交</button>
        <button type="button" onclick="history.back();" class="ico_return">
          <fmt:message key="sys.title.return"/></button>
      </div>
      <form:hidden path="siteCodes" />
      <form:hidden path="seq"/>
      <input type="hidden" name="opType"/>
    </form:form>
    
    </div>
  </div>
  <!--right end-->
<!--main end-->
<!--footer start-->
<c:import url="../../../include/footer.jsp"/>
<!--footer end-->
<script>
   var requiredList = ["#meetingCost","purpose","#supportBy","#supportContactor","#supportTel","#meetingCost", "#description"];
   var intFields=["#meetingCost"];
  function doAction(str){
	  $("#op").val(str);
	  if("send"==str){
// 		  var amount=$("#amount").val();
// 		  if(parseFloat(amount)*100>parseFloat($("#corplimitInfo tr").eq(0).find("td:eq(7)").text())){
// 			  $("#amount").val("");
// 			  jQuery.messager.alert('提示:','申请数量过大，超过余额!','info');
// 			  return;
// 		  }
	  }
	  $('#form').submit();
  }
  function init_page(){
	  //额度显示
	   var dt=new Date();
	  $("#corplimitInfo tr").eq(0).find("td:eq(1)").text(dt.getFullYear());
	  $("#corplimitInfo tr").eq(0).find("td:eq(5)").text(emptyParse("${busage.cost}"));
	  
	  var func="${corp.funcClassify}";
	  var btotal;
	  if("orgUser"==func){
		  btotal="${limit.jg_fullyearB}";
	  }
	  else if("parkUser"==func){
		  btotal="${limit.kj_fullyearB}";
	  }
	  else{
		  btotal="${limit.qy_fullyear}";
	  }
	  var buse="${busage.cost}";
	  $("#corplimitInfo tr").eq(0).find("td:eq(7)").text(emptyParse(btotal)-emptyParse(buse));
	  
	  //approve显示与隐藏
	  if(!('true'=="${approve}")){
	  	$("#corplimitInfo tr").eq(0).find("td:eq(2)").hide();
	  	$("#corplimitInfo tr").eq(0).find("td:eq(3)").hide();
	  }
	  else{
		  //单位名称和法人代表修改
		  $("#corp_unitName").text("${bean.corp.unitName}");
		  $("#corp_representative").text("${bean.corp.representative}");
	  }
	  
	//企业认定情况多选
	  var corplevel="${corp.level}";
	  $("input[name='corp.level']").each(function(ids,itm){
		  if(corplevel.indexOf(itm.value)>-1){
			  $(itm).attr("checked",'true');
		  }
	  });
	  if(corplevel.indexOf("otherBusiness")==-1){
		  $("input[id='corp.levelOther']").hide();
	  }
  }
  
  function emptyParse(str){
	  if(str==""||str==null){
		  return 0;
	  }
	  else {
		  return parseFloat(str);
	  }
  }
  
  $(function(){
	  init_page();
	  
	  
  })
  
</script>
</body>
</html>
