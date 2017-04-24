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
          	<td class="td1"><b>本年税收</b></td>
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
          		100元*<form:input path="amount" cssClass="input_txt w_109"/>张
          </td>
          <td width="10%" class="td1"><b>会议名称</b></td>
          <td width="25%" class="td2">
          	<form:input path="meetingName"  cssClass="input_txt w_209"/>
          </td>
        </tr>
        <tr>
        	<td class="td1">
          		<b>会议时间</b>
          	</td>
          	<td class="td2">
          	<form:input path="startDate"  cssClass="input_txt w_109" onfocus="WdatePicker({minDate: '%y-%M-#{%d+3}' })"/>
				<form:select path="timeperiod">
					<form:option value="" label="--请选择--"/>
					<c:forEach items="${lookups_SJDGL}" var="item">
						<form:option value="${item.lCode}">${item.lName}</form:option>
					</c:forEach>
				</form:select>
          	</td>
        	<td class="td1"><b>申请会议场地名称</b></td>
	          <td class="td2">
	          	<form:input path="siteName" style="float:left" cssClass="input_txt w_209" readonly="true"/>
	          	<c:import url="help/showSiteChoose.jsp"></c:import>
	          </td>
        </tr>
         <tr>
       	  <td class="td1"><b>申请用途</b></td>
          <td class="td2" colspan='5'><form:textarea path="purpose" cssStyle="float: left" cols="96" rows="8"/>
			  <div style="float: left;margin-top: 100px;margin-bottom: 0px;" class='bt_sel'><span id="exampleView">查看事例</span></div>
		  </td>
        </tr>   
      </table>

		<div id="examplewin" style="position: absolute;width: 450px;height: 75px;background: #f5f5f5;border: 1px solid skyblue; display: none;left: 48%;top:156%;">
			<a>本次会议(或沙龙、路演等活动)由XX机构主办，会议于X月X日,X午X点举行，参加人员约X人，参加人员主要包括XX行业专家(或公司员工,相关公司负责人等)。会议主要议程包括XXXX。本公司(或企业、功能性机构、科技园区、众创空间、产业基地等)承诺所举行的会议(或沙龙、路演等活动),依法依规进行，且未为非盈利性质。</a>
		</div>

      <a style="margin-top: 15px;" href="javascript:void(0);" class="table_head">>>A券额度使用信息<span onclick="movePanel('panel1')"></span></a>
      <table id="corplimitInfo" class="table_list t_hs">
      	<tr>
      		<td class="td1" width="12%">当前年份</td>
      		<td class="td2" width="10%"><label></label></td>
      		<td class="td1" width="12%">单位名称</td>
      		<td class="td2" width="10%"><label>${bean.corp.unitName}</label></td>
      		<td class="td1" width="12%">已使用数量(张数)</td>
      		<td class="td2" width="10%"><label></label></td>
      		<td class="td1" width="12%">已使用金额(元)</td>
      		<td class="td2" width="10%"><label></label></td>
      		<td class="td1" width="12%">余额(元)</td>
      		<td class="td2" width="10%"><label></label></td>
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
      <form:hidden path="op"/>
    </form:form>
    
    </div>
  </div>
  <!--right end-->
<!--main end-->
<!--footer start-->
<c:import url="../../../include/footer.jsp"/>
<!--footer end-->
<script>
var requiredList = ["#amount","#timeperiod", "#meetingName","#startDate","#siteName","#purpose"];
var intFields=["#amount"];
function doAction(str){
	  var dzed=parseFloat("${limit.couponMoney}");
	  $("#op").val(str);
	  if("send"==str){
		  var amount=$("#amount").val();
		  
		  var dced=0,ndze=0;
		  var func="${corp.funcClassify}";
		  if("orgUser"==func){
			  dced="${limit.jg_sigleA}";
			  ndze="${limit.jg_fullyearA}";
		  }
		  else if("parkUser"==func){
			  dced="${limit.kj_sigleA}";
			  ndze="${limit.kj_fullyearA}";
		  }
		  else{
			  dced="${limit.qy_sigle}";
			  ndze="${limit.qy_fullyear}";
		  }
		  
		//单次额度判定
		  if(parseFloat(amount)*dzed>=dced){
			  $("#amount").val("");
			  msg('申请数量过大，超过单次申请额!');
			  return;
		  }
		  //总额判定
		  if(parseFloat(amount)*dzed>=ndze){
			  $("#amount").val("");
			  msg('申请数量过大，超过余额!');
			  return;
		  }
	  }
	  $.post('confmConfUse.htm',$('#form').serialize(),function(data){
		  if(data=='1'){
			  doSubmit();
		  }
		  else{
			  msg(data);
		  }
	  });
}



function init_page(){
	  //额度显示
	  var dt=new Date();
	  $("#corplimitInfo tr").eq(0).find("td:eq(1)").text(dt.getFullYear());
	  $("#corplimitInfo tr").eq(0).find("td:eq(5)").text(emptyParse("${ausage.amount}"));
	  $("#corplimitInfo tr").eq(0).find("td:eq(7)").text(emptyParse("${ausage.cost}"));

	  
	  var func="${corp.funcClassify}";
	  var atotal;
	  if("orgUser"==func){
		  atotal="${limit.jg_fullyearA}";
	  }
	  else if("parkUser"==func){
		  atotal="${limit.kj_fullyearA}";
	  }
	  else{
		  atotal="${limit.qy_fullyear}";
	  }
	  var ause="${ausage.cost}";
	  $("#corplimitInfo tr").eq(0).find("td:eq(9)").text(atotal-ause);
	  
	  
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
		  return "0";
	  }
	  else {
		  return parseFloat(str);
	  }
  }


  $(function(){
	  init_page();


	  $("#exampleView").click(function(){
		  if($("#examplewin").css('display')=='none'){
			  $("#examplewin").show();
			  $(this).text("隐藏事例");
		  }
		  else{
			  $("#examplewin").hide();
			  $(this).text("查看事例");
		  }
	  });


	  $("#startDate").unbind("click");

  })
</script>
</body>
</html>
