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
      <a href="javascript:void(0);" class="table_head">>>长宁区科技创新券A券申请信息<span onclick="movePanel('panel1')"></span></a>
      <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
      	<tr>
      		<td class="td1" width="15%"><b>单位名称</b></td>
          	<td class="td2" width="30%"><form:label path="corp.unitName" id="corp_unitName" cssClass="w_209">${corp.unitName}</form:label></td>
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
          <td width="15%" class="td1" rowspan="2"><b>申请创新券种类</b></td>
          <td width="5%" class="td2" rowspan="2">
          	<input type="checkbox" value="A券" checked="checked" onclick="return false"/>A券     	
          </td>
          <td width="35%" class="td2" colspan="2">
          		100元*<form:label path="amount">${bean.amount}</form:label>张
          </td>
          <td width="10%" class="td1"><b>会议名称</b></td>
          <td width="25%" class="td2">
          	<form:label path="meetingName">${bean.meetingName}</form:label>
          </td>
        </tr>
        <tr>
        	<td class="td1">
          		<b>会议时间</b>
          	</td>
          	<td class="td2">
          		<fmt:formatDate  pattern="yyyy-MM-dd" value="${bean.startDate}" var="start_date"/>
          		<form:label path="startDate">${start_date}</form:label>
              <form:select path="timeperiod" disabled="true">
                <form:option value="" label="--请选择--"/>
                <c:forEach items="${lookups_SJDGL}" var="item">
                  <form:option value="${item.lCode}">${item.lName}</form:option>
                </c:forEach>
              </form:select>
          	</td>
        	<td class="td1"><b>申请会议场地名称</b></td>
	          <td class="td2">
	          	<form:label path="siteName">${bean.siteName}</form:label>
	          </td>
        </tr>
         <tr>
       	  <td class="td1"><b>申请用途</b></td>
          <td class="td2" colspan='5'><form:textarea path="purpose" cols="96" rows="3" readonly="true"/></td>
        </tr>  
        
        <tr>
       	  <td class="td1"><b>会议序号</b></td>
          <td class="td2" colspan='5'>
          	 <form:input path="meetingNumber" cssClass="input_txt w_209"/>
		  </td>
        </tr>  
         
      </table>  
      <div class="an">
        <button type="button" onclick="doSubmit()" class="ico_tmpSave">
          确认</button>
        <button type="button" onclick="history.back();" class="ico_return">
          <fmt:message key="sys.title.return"/></button>
      </div>
      <form:hidden path="siteCodes" />
      <form:hidden path="seq"/>
    </form:form>
    
    </div>
  </div>
  <!--right end-->
<!--main end-->
<!--footer start-->
<c:import url="../../../include/footer.jsp"/>
<!--footer end-->
<script>
   var requiredList = ["#meetingNumber"];
   
   function init_page(){
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
   
  $(function(){
	  
	  init_page();
	  
	  $("#meetingNumber").blur(function(){
		  //同步处理，否则出现用户在未失焦的状态下提交 bug
		  $.ajaxSetup({   
	            async : false  
	       }); 
		  $("#meetingNumber").parent().find('span').remove();
		  $("#meetingNumber").parent().find('a').remove();
		  var strNumber=$(this).val();
		  $.post(base + '/couponMng/couponA/checkMeetingNumber.htm', {strNumber:strNumber}, function (data) {
			  if(data[0].success){
				  var str="<a style='color:green'>"+data[0].message+"</a>";
				  $("#meetingNumber").after(str);
				  
			  }
			  else{
				  var str="<a style='color:red'>("+data[0].message+")</a>";
				  $("#meetingNumber").after(str);
				  $("#meetingNumber").val("");
			  }
		  },'json');
	  });
	  
  })
  
</script>
</body>
</html>
