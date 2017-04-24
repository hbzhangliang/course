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
      <c:import url="../../../include/businessEntityParams.jsp"/>
      <!--list start-->
      <a href="javascript:void(0);" class="table_head">>>申请单位基本信息<span onclick="movePanel('panel1')"></span></a>
      <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
      	
      	  <form:hidden path="name" value="${bean.provider.name}"/>
      	<tr>
      		<td class="td1" width="15%"><b>申请单位名称</b></td>
          	<td class="td2" colspan="3">
          		<form:label path="name" cssClass="w_209">${bean.provider.name }</form:label>
          	</td>
      	</tr>
      	<tr>
      		<td class="td1" width="15%" rowspan="4"><b>银行账户信息</b></td>
      		<td class="td2" colspan="3">
          		<gw:chooseBank param_Type='provider' param_Pid="${provider.id}" renderBankId="bankId" renderBankName="bankname" renderBankAccount="bankaccount" renderUserName="bankusername"/>
          	</td>
      	</tr>
      	<tr>
      		<td class="td2" colspan="3">
          		<b>开户银行：</b><label id='bankname'></label>	<label id='bankId' class='hidePannel'></label>
          		
          	</td>
      	</tr>
      	<tr>
      		<td class="td2" colspan="3">
          		<b>账号名：</b><label id='bankusername'></label>
          	</td>
      	</tr>
      	<tr>
      		<td class="td2" colspan="3">
          		<b>银行账号：</b><label id="bankaccount"></label>
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
<!--           	 名称：<input type="text" id="displayName" class="input_txt w_109"/> -->
<%--             	<gw:fileUpload objectId="${bean.id}" rename="true"/> --%>
<!--           	</td> -->
<!--           </tr> -->
       </table>
       <a style="margin-top: 10px;margin-bottom: 10px;" href="javascript:void(0);" class="table_head">>>需要兑现的科技创新券<span onclick="movePanel('panel1')"></span></a>
         <div class="an">
         	<c:import url="help/CouponChsebyProvider.jsp"></c:import>
        </div>
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
      	<td class="td1" width="160px"><b>活动成效材料</b><br/><label class='redcolor'>(可上传多个附件)</label></td>
          	<td class="td2" colspan="5">
          	 名称：<input type="text" id="displayName" class="input_txt w_109"/>
            	<gw:fileUpload objectId="${bean.id}" rename="true"/>
          	</td>
          </tr>
    </table>
    
    <form:hidden path="bank.id"/>
      <div class="an">
          <button type="button" onclick="doAction('send')" class="ico_send">
          提交</button>
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
	var requiredList=["#effect"];
	

	var serveItem={
			  amount:null,
			  cost:null,
			  applyId:null,
			  number:null,
			  company:null,
			  invoiceCode:null,
			  invoiceNumber:null,
			  invoiceDate:null,
			  invoiceMoney:null,
			  content:null,
			  money:null
	};
    Itemlist=[];
    
    var totalamount=0,totalcost=0,itemNumber=0;
    
    
    
    function listStatistic(){
    	totalamount=0;
    	totalcost=0;
    	$("#cashApply_pannel").find('tr:gt(0)').each(function(ind,obj){
    		totalamount+=parseInt($(obj).find('td').eq(7).text());
			 totalcost+=parseInt($(obj).find('td').eq(8).text());
    	});
    	var str="<tr>";
    	str+="<td colspan='3'><b>总计</b></td>";
    	str+="<td>科技券数量(张)</td>";
    	str+="<td colspan='2'>"+totalamount+"</td>";
    	str+="<td>科技券总金额(元)</td>";
    	str+="<td  colspan='2'>"+totalcost+"</td>";
    	str+="</tr>";
    	$("#cashApply_pannel").append(str);
    }
    
    //数据绑定
    function listSynForm(){
    	if(Itemlist.length>0){
    		for(var i in Itemlist){
    			var str="";
				 str+="<input type='hidden' name='items["+i+"].applyId' value='"+Itemlist[i]+"'/>";
				 $("#form").append($(str));
    		}
    	}
    	//统计的数目放在前台
    	var str="<input type='hidden' name='amount' value='"+totalamount+"'/>";
    	str+="<input type='hidden' name='cost' value='"+totalcost+"'/>";
    	$("#form").append($(str));
    }
    
    function doAction(type){
    	//提交时候的处理
    	if("send"==type){
    		//数据绑定
    		if(Itemlist.length==0){
    			msg("请先添加创新券项目明细");
    			return ;
    		}
    		if($("#bankId").text().length==0){
    			msg('请选择绑定的银行账户');
    			return;
    		}
    		$("#bank\\.id").val($("#bankId").text());
    		
			listSynForm();
			doSubmit();
    	}
    }
    
    $(function(){
    	$("#btnClosePannel").click(function(){
	   		 $(".hovePannel tr").eq(0).nextAll().remove();
	   		 $(".hovePannel").hide();
   		 });
    })
	 
</script>
</body>
</html>
