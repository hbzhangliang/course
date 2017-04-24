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
  
  <div class="hovePannel">
  		<table  class="table_01">
	  	<tr>
	  		<th width="5%">券种</th>
	        <th width="10%">流水号</th>
	        <th width="10%">会议序号</th>
	        <th width="10%">会场名称</th>
	        <th width="10%">会议名称</th>
	        <th width="10%">会议时间</th>
	        <th width="10%">科技券数量</th>
	        <th width="10%">科技券金额</th>
	        <th width="10%">流转状态</th>
	    </tr>
  	</table>
  		<div align="center" style="margin: 3px;"><input id="btnClosePannel" type="button" value="关闭"></div>
  	</div>
  	
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
          		<form:label path="name" cssClass="w_209">${provider.name }</form:label>
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
          		<label>${provider.contact}</label>
          	</td>
          	<td class="td1" width="15%"><b>联系电话</b></td>
          	<td class="td2" width="30%">
          		<label>${provider.tel}</label>
          	</td>
      	</tr>
      	<tr>
      		<td class="td1" width="15%"><b>手机</b></td>
          	<td class="td2" width="30%">
          		<label>${provider.mobile}</label>
          	</td>
          	<td class="td1" width="15%"><b>Email</b></td>
          	<td class="td2" width="30%">
          		<label>${provider.email}</label>
          	</td>
      	</tr>
<!--       	<tr> -->
<!--       		<td class="td1"><b>证明材料</b><br/><label class='redcolor'>(可上传多个附件)</label></td> -->
<!--           	<td class="td2" colspan="5"> -->
<%--             	<gw:fileUpload objectId="${bean.id}"/> --%>
<!--           	</td> -->
<!--           </tr> -->
       </table>
       
       <a style="margin-top: 10px;margin-bottom: 10px;" href="javascript:void(0);" class="table_head">>>兑现的科技创新券<span onclick="movePanel('panel1')"></span></a>
        <table id="cashApply_pannel" class="table_01">
      <tr>
        
        <th  class='hidePannel' width="5%">编号</th>
  		<th width="5%">券种</th>
        <th width="10%">流水号</th>
        <th width="10%">会议序号</th>
        <th width="10%">会场名称</th>
        <th width="10%">会议名称</th>
        <th width="10%">会议时间</th>
        <th width="10%">科技券数量</th>
        <th width="10%">科技券金额</th>
        <th width="10%">流转状态</th>
      </tr>
      <c:forEach items="${bean.couponapplies}" var="item" varStatus="i">
      <tr>
      	<td class='hidePannel'>${item.id}</td>
      	<td><gw:lookups category="${lookups_KJLX}" lookupsCode="${item.type}"/></td>
      	<td>${item.seq}</td>
      	<td>${item.meetingNumber}</td>
      	<td>${item.siteName}</td>
      	<td>${item.meetingName}</td>
      	<td><fmt:formatDate value="${item.startDate}" pattern="yyyy-MM-dd" /></td>
      	<td>${item.amount}</td>
      	<td><fmt:formatNumber pattern="0" value="${item.meetingCost}"></fmt:formatNumber></td>
      	<td><gw:lookups category="${lookups_LZZT}" lookupsCode="${item.status}"/></td>
      </tr>
      </c:forEach>
    </table>
    
    <a style="margin-top: 10px;margin-bottom: 10px;" href="javascript:void(0);" class="table_head">>>科技创新券使用成效<span onclick="movePanel('panel1')"></span></a>
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
      		<td class="td1" width="160px;"><b>证明材料</b><br/><label class='redcolor'>(可上传多个附件)</label></td>
          	<td class="td2" colspan="5">
            	<gw:fileUpload objectId="${bean.id}"/>
          	</td>
          </tr>
    </table>
    
     <a style="margin-top: 10px;margin-bottom: 10px;" href="javascript:void(0);" class="table_head">>>审核意见<span onclick="movePanel('panel1')"></span></a>
    <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
    <tr>
    	<td class="td2">
    		<a>*申请单位意见（申报信息是否属实）：</a>
    	</td>
    </tr>
    <tr>
    	<td class="td2">
    		<form:textarea path="suggestion" cols="120" rows="6"/>
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
		var totalamount=${bean.amount};
    	var totalcost=${bean.cost};
    	var str="<tr>";
    	str+="<td colspan='3'><b>总计</b></td>";
    	str+="<td>科技券数量(张)</td>";
    	str+="<td colspan='2'>"+totalamount+"</td>";
    	str+="<td>科技券总金额(元)</td>";
    	str+="<td  colspan='2'>"+totalcost+"</td>";
    	str+="</tr>";
    	$("#cashApply_pannel").append(str);
	}
	
	function dohelpView(item){
		if($(".hovePannel").is(":visible")){
    		$(".hovePannel tr").eq(0).nextAll().remove();
    	}
		var apply=$(item).closest('tr').attr('id').substr(3);
    	$.post(base + '/couponMng/couponConfirm/getCouponByApplyId.htm', {applyId:apply}, function (data) {
    		var str="<tr>";
			  str+="<td>"+partternCheck(data[0].type,'type')+"</td>";
			  str+="<td>"+data[0].seq+"</td>";
			  str+="<td>"+data[0].meetingNumber+"</td>";
			  str+="<td>"+data[0].sitenames+"</td>";
			  str+="<td>"+data[0].meetingname+"</td>";
			  str+="<td>"+data[0].starttime+"</td>";
			  str+="<td>"+data[0].amount+"</td>";
			  str+="<td>"+partternCheck(data[0].cost,'cost')+"</td>";
			  str+="<td>"+partternCheck(data[0].status,'status')+"</td>";
			  str+="</tr>"
			 $(".hovePannel").show().find('table').append(str);
			  
    	},'json');
    	$("#btnClosePannel").removeAttr("disabled");
    	
	}
	
	function partternCheck(value,type){
		if("type"==type){
			return value=="AKJQ"?"A券":"B券";
		}
		else if("cost"==type){
			if(value!=null)
				return parseInt(value);
			else{
				return "";
			}
		}
		else if("status"==type){
			var str="";
			switch(value){
				case "paidconfirmed":str="使用已确认";break;
				case "fareBalance":str="已反馈待结算";break;
				case "fareBalanced":str="费用已结算";break;
			}
			return str;
		}
	}
	
	
	function doAction(){
		var suggestion=$("#suggestion").val();
		if(suggestion.length==0||suggestion==null){
			msg('请填写审核意见');
			return;
		}
		$.messager.defaults = { ok: "支付", cancel: "取消",width:'300px',height:'180px'};
	 	  $.messager.confirm("操作提示", "支付结果？", function (flag) {
	 		  if(flag){
	 	       	  var cashapplyId="${bean.id}";
	 	       	  $.post(base + '/couponMng/feeApprove/audit.htm', {id:cashapplyId,suggestion:suggestion}, function (data) {
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
		
		$("#btnClosePannel").click(function(){
	   		 $(".hovePannel tr").eq(0).nextAll().remove();
	   		 $(".hovePannel").hide();
  		 });
		
	});
	
</script>
</body>
</html>
