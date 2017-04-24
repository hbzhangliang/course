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
<%--       <c:import url="../../../include/businessEntityParams.jsp"/> --%>
      <!--list start-->
      <a href="javascript:void(0);" class="table_head">>>申请单位基本信息<span onclick="movePanel('panel1')"></span></a>
      <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
      	<tr>
      		<td class="td1" width="15%"><b>申请单位名称</b></td>
          	<td class="td2" colspan="3">
          		<form:label path="name" cssClass="w_209">${corp.unitName }</form:label>
          	</td>
      	</tr>
      	<tr>
      		<td class="td1" width="15%" rowspan="3"><b>银行账户信息</b></td>
          	<td class="td2" colspan="3">
          		<b>开户银行：</b><label>${bankAccount.bankname}</label>
          	</td>
      	</tr>
      	<tr>
      		<td class="td2" colspan="3">
          		<b>账号名：</b><label>${bankAccount.username}</label>
          	</td>
      	</tr>
      	<tr>
      		<td class="td2" colspan="3">
          		<b>银行账号：</b><label>${bankAccount.account}</label>
          	</td>
      	</tr>
      	<tr>
      		<td class="td1" width="15%"><b>联系人</b></td>
          	<td class="td2" width="30%">
          		<label>${corp.contact}</label>
          	</td>
          	<td class="td1" width="15%"><b>联系电话</b></td>
          	<td class="td2" width="30%">
          		<label>${corp.tel}</label>
          	</td>
      	</tr>
      	<tr>
      		<td class="td1" width="15%"><b>手机</b></td>
          	<td class="td2" width="30%">
          		<label>${corp.mobile}</label>
          	</td>
          	<td class="td1" width="15%"><b>Email</b></td>
          	<td class="td2" width="30%">
          		<label>${corp.email}</label>
          	</td>
      	</tr>
<!--       	<tr> -->
<!--       		<td class="td1"><b>证明材料</b><br/><label class='redcolor'>(可上传多个附件)</label></td> -->
<!--           	<td class="td2" colspan="5"> -->
<%--             	<gw:fileUpload objectId="${bean.id}"/> --%>
<!--           	</td> -->
<!--           </tr> -->
       </table>
       <a style="margin-top: 10px;margin-bottom: 10px;" href="javascript:void(0);" class="table_head">>>科技券信息<span onclick="movePanel('panel1')"></span></a>
        <div style="margin-bottom: 20px;">
        	<table id="couponInfo_pannel" class="table_01">
		      <tr>
	          		<th width="5%">券种</th>
			        <th width="10%">流水号</th>
			        <th width="10%">申请用途</th>
			        <th width="10%">支持情况</th>
			        <th width="10%">支持单位</th>
			        <th width="10%">联系人</th>
			        <th width="10%">联系电话</th>
			        <th width="10%">申请时间</th>
			        <th width="10%">流转状态</th>
		      </tr>
		      <c:forEach items="${bean.couponapplies}" var="item" varStatus="i">
          			<tr>
          				<td><gw:lookups category="${lookups_KJLX}" lookupsCode="${item.type}"/></td>
          				<td>${item.seq}</td>
          				<td>${item.purpose}</td>
          				<td><gw:lookups category="${lookups_ZCTJ}" lookupsCode="${item.supportType}"/></td>
          				<td>${item.supportBy}</td>
          				<td>${item.supportContactor}</td>
          				<td>${item.supportTel}</td>
          				<td><fmt:formatDate value="${item.applydate}" pattern="yyyy-MM-dd" /></td>
          				<td><gw:lookups category="${lookups_LZZT}" lookupsCode="${item.status}"/></td>
          			</tr>
		      </c:forEach>
		   </table>
        </div>
        
       <a style="margin-top: 10px;margin-bottom: 10px;" href="javascript:void(0);" class="table_head">>>兑现科技创新券的项目明细<span onclick="movePanel('panel1')"></span></a>
        <table id="cashApply_pannel" class="table_01">
      <tr>
        <th width="10%" class="orderBy">序号</th>
        <th width="10%" class="orderBy">服务单位</th>
        <th width="10%" class="orderBy">发票代码</th>
        <th width="10%" class="orderBy">发票号码</th>
        <th width="10%" class="orderBy">发票日期</th>
        <th width="10%" class="orderBy">发票金额(元)</th>
        <th width="10%" class="orderBy">服务项目</th>
        <th width="10%" class="orderBy">服务金额(元)</th>
      </tr>
      
      <c:forEach items="${bean.serviceItems}" var="item" varStatus="i">
        <tr id="tr_${item.id}">
          <td>${item.number}</td>
          <td>${item.company}</td>
          <td>${item.invoiceCode}</td>
          <td>${item.invoiceNumber}</td>
          <td><fmt:formatDate value="${item.invoiceDate}" pattern="yyyy-MM-dd" /></td>
          <td><fmt:formatNumber pattern="0" value="${item.invoiceMoney}"></fmt:formatNumber></td>
          <td><gw:lookups category="${lookups_ZCLX}" lookupsCode="${item.content}"/></td>
          <td><fmt:formatNumber pattern="0" value="${item.money}"></fmt:formatNumber></td>
        </tr>
      </c:forEach>
      <tr>
      	<td colspan="3">总计</td>
      	<td colspan="2">总金额(元)</td>
      	<td colspan="3"><label><fmt:formatNumber pattern="0" value="${bean.cost}"></fmt:formatNumber></label></td>
      </tr>
    </table>
    
    <a style="margin-top: 10px;margin-bottom: 10px;" href="javascript:void(0);" class="table_head">>>活动成效<span onclick="movePanel('panel1')"></span></a>
    <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
    <tr>
    	<td class="td2" colspan="6">
    		<a>*使用科技创新券解决的关键问题和取得社会经济效益，以案例说明。</a>
    	</td>
    </tr>
    <tr>
    	<td class="td2" colspan="6">
    		<form:textarea path="effect" cols="120" rows="6"/>
    	</td>
    </tr>
    
    <tr>
      		<td class="td1" width="160px;"><b>活动成效材料</b><br/><label class='redcolor'>(可上传多个附件)</label></td>
          	<td class="td2" colspan="5">
            	<gw:fileUpload objectId="${bean.id}"/>
          	</td>
          </tr>
          
    </table>
    
     <a style="margin-top: 10px;margin-bottom: 10px;" href="javascript:void(0);" class="table_head">>>审核意见<span onclick="movePanel('panel1')"></span></a>
    <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
    <tr>
    	<td class="td2" colspan="2">
    		<a>*申请单位意见（申报信息是否属实）：</a>
    	</td>
    </tr>
    <tr>
    	<td class="td2" colspan="2">
    		<form:textarea path="suggestion" cols="120" rows="6"/>
    	</td>
    </tr>
    
    <tr>
    	<td class="td1">
    		支付金额
    	</td>
    	<td class="td2">
<!--     		<input id="money" type="text" class="w_209" /> -->
    		<form:input path="cost" cssClass="w_209"/>
    	</td>
    </tr>
    
    </table>
      <div class="an">
      <button type="button" onclick="doAction();" class="ico_send">
          结算</button>
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

	function init_page(){
		var op="${bean.op}";
		if('v'!=op){
			$("#cost").val("");
		}
	
	}
	
	function doAction(){
		var suggestion=$("#suggestion").val();
		var money=$("#cost").val();
		if(suggestion.length==0||suggestion==null){
			msg('请填写审核意见');
			return;
		}
		if (!money.match(/^[0-9]+$/)) {
			msg('请填写支付金额,且是整数');
			return;
		}
		$.messager.defaults = { ok: "支付", cancel: "取消",width:'300px',height:'180px'};
		  $.messager.confirm("操作提示", "支付结果？", function (flag) {  
			  if(flag){
				  var cashapplyId="${bean.id}";
				  $.post(base + '/couponMng/feeApprove/audit.htm', {id:cashapplyId,suggestion:suggestion,cost:money}, function (data) {
	 	       		  if(data=="Success"){
	 	       			  msg("已成功拨付");
	 	       		  }
	 	       		  else{
	 	       			  msg(data); 
	 	       		  }
	 	       		  setTimeout(function(){
	 	       			  window.location.href=base+'/couponMng/feeApprove/list.htm';
	 	       		  },500)
	 	       	  });
			  }
	      }); 
	}
	
	
    $(function(){
    	init_page();
    })
</script>
</body>
</html>
