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
    <!--tit start-->
    <form:form action="save.htm" method="post" modelAttribute="bean" id="form">
      <c:import url="../../../include/pageParams.jsp"/>
      <c:import url="../../../include/businessEntityParams.jsp"/>
      <form:hidden path="regDate"/>
      <!--list start-->
      <a href="javascript:void(0);" class="table_head">>>资料维护<span onclick="movePanel('panel1')"></span></a>
      <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
        <tr>
          <td class="td1" width="15%"><b>企业名称</b></td>
          <td class="td2" width="35%">
            <form:input path="unitName" cssClass="input_txt w_209"/>
          </td>
          <td class="td1" width="15%"><b>是否三证合一</b></td>
          <td class="td2">
            <form:radiobuttons items="${lookups_YN}" path="isUnionCard" itemLabel="lName"
                               itemValue="lCode"/>
          </td>
        </tr>
        <tr id="unioncardpannl">
<%--           <c:if test="${bean.isUnionCard}"> --%>
            <td class="td1"><b>统一社会信用代码</b></td>
            <td class="td2" colspan="3">
				<form:input path="creditCode" cssClass="input_txt w_209"/>
            </td>
<%--           </c:if> --%>
<%--           <c:if test="${!bean.isUnionCard}"> --%>
		<tr>
          <td class="td1"><b>组织机构代码</b></td>
          <td class="td2">
            <form:input path="orgCode" cssClass="input_txt w_209"/>
          </td>
          <td class="td1"><b>工商营业执照</b></td>
          <td class="td2">
            <form:input path="license" cssClass="input_txt w_209"/>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>税务登记证</b></td>
          <td class="td2">
            <form:input path="taxLicense" cssClass="input_txt w_209"/>
          </td>
<%--           </c:if> --%>
          <td class="td1"><b>法人代表</b></td>
          <td class="td2">
            <form:input path="representative" cssClass="input_txt w_209"/>
          </td>
        </tr>
         <tr>
          <td class="td1"><b>工商注册时间</b></td>
          <td class="td2" colspan="3">
            <form:input path="applyDate" cssClass="input_txt w_209"/>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>注册地址</b></td>
          <td class="td2" colspan="3">
            <form:input path="registerAddress" cssClass="input_txt w_690"/>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>办公地址</b></td>
          <td class="td2" colspan="3">
            <form:input path="contactAddress" cssClass="input_txt w_690"/>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>邮编</b></td>
          <td class="td2">
            <form:input path="postcode" cssClass="input_txt w_209"/>
          </td>
          <td class="td1"><b>联系人</b></td>
          <td class="td2">
            <form:input path="contact" cssClass="input_txt w_209"/>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>联系电话</b></td>
          <td class="td2">
            <form:input path="tel" cssClass="input_txt w_209"/>
          </td>
          <td class="td1"><b>移动电话</b></td>
          <td class="td2">
            <form:input path="mobile" cssClass="input_txt w_209"/>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>电子邮件</b></td>
          <td class="td2">
            <form:input path="email" cssClass="input_txt w_209"/>
          </td>
          <td class="td1"><b>注册资金</b></td>
          <td class="td2">
            <form:input path="capital" cssClass="input_txt w_209"/>（万元）
          </td>
        </tr>
        <tr>
          <td class="td1"><b>上年度从业人员</b></td>
          <td class="td2">
            <form:input path="previousPersonals" cssClass="input_txt w_209"/>（人）
          </td>
          <td class="td1"><b>上年度销售额</b></td>
          <td class="td2">
            <form:input path="previousSales" cssClass="input_txt w_209"/>（万元）
          </td>
        </tr>
        <tr>
          <td class="td1"><b>上年度企业净资产</b></td>
          <td class="td2">
            <form:input path="previousAsset" cssClass="input_txt w_209"/>（万元）
          </td>
          <td class="td1"><b>上年度税收总额</b></td>
          <td class="td2">
            <form:input path="previousRevenue" cssClass="input_txt w_209"/>（万元）
          </td>
        </tr>
        <tr>
        	<td class="td1"><b>公司网址</b></td>
          <td class="td2">
            <form:input path="network" cssClass="input_txt w_209" />
          </td>
          <td class="td1"><b>本年度税收</b></td>
          <td class="td2">
            <form:input path="revenue" cssClass="input_txt w_209"/>（万元）
          </td>
        </tr>
        <tr>
          <td class="td1"><b>单位性质</b></td>
          <td class="td2" colspan="3">
            <form:radiobuttons path="type" items="${lookups_DWXZ}" itemLabel="lName" itemValue="lCode" readonly="true"/>
            <c:if test="${bean.type eq 'otherCorp'}">
              <form:input path="typeOther" readonly="true" cssClass="input_txt w_209"/>
            </c:if>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>产业领域</b></td>
          <td class="td2" colspan="3">
            <form:radiobuttons path="industry" items="${lookups_CYLY}" itemLabel="lName" itemValue="lCode"
                               readonly="true"/>
            <c:if test="${bean.industry eq 'otherCorp'}">
              <form:input path="otherRegion" readonly="true" cssClass="input_txt w_209"/>
            </c:if>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>企业认定情况</b></td>
          <td class="td2" colspan="3">
<%--             <form:radiobuttons path="level" items="${lookups_RDQK}" itemLabel="lName" itemValue="lCode" --%>
<%--                                readonly="true"/> --%>
<%--             <c:if test="${bean.type eq 'otherBusiness'}"> --%>
<%--               <form:input path="levelOther" readonly="true" cssClass="input_txt w_209"/> --%>
<%--             </c:if> --%>
				<form:checkboxes path="level" items="${lookups_RDQK}" itemLabel="lName" itemValue="lCode"/>
					<form:input path="levelOther"/>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>企业性质认定</b></td>
          <td class="td2" colspan="3">
            <form:radiobuttons path="funcClassify" items="${lookups_QYLX}" itemLabel="lName" itemValue="lCode" readonly="readonly"/>
          </td>
        </tr>
<%--         <c:if test="${bean.funcClassify eq 'orgUser'}"> --%>
          <tr id="gnfujgnr">
            <td class="td1"><b>功能性机构服务内容</b></td>
            <td class="td2" colspan="3">
              <form:radiobuttons path="funcInfo" items="${lookups_FWJG}" itemLabel="lName" itemValue="lCode"
                                 readonly="true"/>
              <c:if test="${bean.funcInfo eq 'otherServ'}">
                <form:input path="funcOther" readonly="true" cssClass="input_txt w_209"/>
              </c:if>
            </td>
          </tr>
<%--         </c:if> --%>
        <tr>
        
        
        <tr>
        	 <td class="td1"><b>企业上市情况</b></td>
	          <td class="td2" colspan="3">
	            <form:radiobuttons path="list_situation" items="${lookups_SSQK}" itemLabel="lName" itemValue="lCode" readonly="readonly"/>
	          </td>
        </tr>
        <tr>
        	<td class="td1"><b>企业简介</b></td>
        	<td class="td2" colspan="3">
        		<form:input path="description" cssClass="input_txt w_690"/>
        	</td>
        </tr>
        <tr>
        	<td class="td1"><b>近些年来业务开展情况及主要项目</b></td>
        	<td class="td2" colspan="3">
        		<form:input path="business_situation" cssClass="input_txt w_690"/>
        	</td>
        </tr>
        <tr>
        	<td class="td1"><b>获得投融资情况</b></td>
        	<td class="td2" colspan="3">
        		<form:input path="investment_situation" cssClass="input_txt w_690"/>
        	</td>
        </tr>
        
        
        <tr>
          <td class="td1"><b>证明材料</b><br/><label class='redcolor'>(可上传多个附件)</label></td>
          <td class="td2" colspan="3">
          名称：<input type="text" id="displayName" class="input_txt w_109"/>
            <gw:fileUpload objectId="${bean.id}" rename="true"/>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>审批情况</b></td>
          <td class="td2" colspan="3">
            <gw:lookups category="${lookups_QYZT}" lookupsCode="${bean.status}"/>
          </td>
        </tr>
      </table>
      <form:hidden path="userType"/>
      <form:hidden path="status"/>
      <form:hidden path="park"/>
      <div class="an">
        <button type="button" onclick="doSubmit();" class="ico_tmpSave">
          <fmt:message key="sys.title.save"/></button>
      </div>
      <form:hidden path="depart.id" />
    </form:form>
  </div>
</div>
<!--right end-->
<!--main end-->
<!--footer start-->
<c:import url="../../../include/footer.jsp"/>
<!--footer end-->
</body>

<script>
	function init_page(){
		 //企业认定情况多选
		  var corplevel="${bean.level}";
		  $("input[name='level']").each(function(ids,itm){
			  if(corplevel.indexOf(itm.value)>-1){
				  $(itm).attr("checked",'true');
			  }
		  });
		  if(corplevel.indexOf("otherBusiness")==-1){
			  $("input[id='levelOther']").hide();
		  }
		  
		  
		  var isunoincard="${bean.isUnionCard}";
		  if(isunoincard=="false"){ //不是三证合一
			  $("#unioncardpannl").hide();
		  }
		  else{  //是三证合一
			  $("#unioncardpannl").show();
		  }
		  
		  var gnjg="${bean.funcClassify}";
		  if(gnjg!="orgUser"){
			  $("#gnfujgnr").hide(500);
		  }
		  
		  $("#userType").val(gnjg);
		  
		  //如果不是科委用户的话，就不能更改
		  var ut="${currentUser.type}";
		  if(ut!="sys"){
			  //$("#isUnionCard,#creditCode,#orgCode,#license,#taxLicense,#funcClassify").css("disabled","disabled");
			  $("input[name='funcClassify']").attr("disabled","disabled");
			  $("#isUnionCard,#creditCode,#orgCode,#license,#taxLicense").attr("disabled","disabled");
		  }
		  
	}
	$(function(){
		init_page();
		
		$("input[name=level]").click(function(){
			if($(this).val()=="otherBusiness"&&$(this).prop('checked')){
				$("input[id='levelOther']").show();
			}
			else if($(this).val()=="otherBusiness"&&!$(this).prop('checked')){
				$("input[id='levelOther']").hide();
			}
		});
		
		
		$("input[name=isUnionCard]").click(function(){
			if($(this).val()=='1'){
				 $("#unioncardpannl").show();
			}
			else{
				$("#unioncardpannl").hide();
			}
		});
		
		$("input[name=funcClassify]").click(function(){
			if($(this).val()=='orgUser'){
				 $("#gnfujgnr").show(500);
			}
			else{
				$("#gnfujgnr").hide(500);
			}
		});
		
		
	})
</script>

</html>
