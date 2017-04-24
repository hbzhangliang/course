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
      <a href="javascript:void(0);" class="table_head">>>申请单位基本信息<span onclick="movePanel('panel1')"></span></a>
      <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
      	
      	  <form:hidden path="name" value="${bean.corp.unitName}"/>
      	<tr>
      		<td class="td1" width="15%"><b>申请单位名称</b></td>
          	<td class="td2" colspan="3">
          		<form:label path="name" cssClass="w_209">${bean.corp.unitName }</form:label>
          	</td>
      	</tr>
      	<tr>
      		<td class="td1" width="15%" rowspan="4"><b>银行账户信息</b></td>
      		<td class="td2" colspan="3">
          		<gw:chooseBank param_Type='corp' param_Pid="${corp.id}" renderBankId="bankId" renderBankName="bankname" renderBankAccount="bankaccount" renderUserName="bankusername"/>
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
<!--           	名称：<input type="text" id="displayName" class="input_txt w_109"/> -->
<%--             	<gw:fileUpload objectId="${bean.id}" rename="true"/> --%>
<!--           	</td> -->
<!--           </tr> -->
       </table>
       <a style="margin-top: 10px;margin-bottom: 10px;" href="javascript:void(0);" class="table_head">>>科技券信息<span onclick="movePanel('panel1')"></span></a>
         <div class="an">
         	<c:import url="help/showcorpCouponCh.jsp"></c:import>
        </div>
        <div style="margin-bottom: 20px;">
        	<table id="couponInfo_pannel" class="table_01">
		      <tr>
		      		<th width="5%">选择</th>
		      		<th width="5%" class='hidePannel'>编号</th>
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
		   </table>
        </div>
        
       <a style="margin-top: 10px;margin-bottom: 10px;" href="javascript:void(0);" class="table_head">>>兑现科技创新券的项目明细<span onclick="movePanel('panel1')"></span></a>
        <div class="an">
         	<button type="button" onclick="doAction('add')" class="ico_send">
          添加</button>
        </div>
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
        <th width="8%"><fmt:message key="biz.title.operation"/></th>
      </tr>
      <tr>
      	<td colspan="4">总计</td>
      	<td colspan="2">总金额(元)</td>
      	<td colspan="3">0</td>
      </tr>
      <c:forEach items="${bean.serviceItems}" var="item" varStatus="i">
        <tr id="tr_${item.id}">
          <td>${item.number}</td>
          <td>${item.company}</td>
          <td>${item.invoiceCode}</td>
          <td>${item.invoiceNumber}</td>
          <td><fmt:formatDate value="${item.invoiceDate}" pattern="yyyy-MM-dd" /></td>
          <td><fmt:formatNumber pattern="0" value="${item.invoiceMoney}"></fmt:formatNumber></td>
          <td>${item.content}</td>
          <td><fmt:formatNumber pattern="0" value="${item.money}"></fmt:formatNumber></td>
          <td>
             <div>
              <a href="javascript:void(0)" onclick="doView(this)">
                <fmt:message key="sys.title.view"/>
              </a>
              <a href="javascript:void(0)" onclick="doDel(this)">
	               	 删除
	          </a>
            </div>
          </td>
        </tr>
      </c:forEach>
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
      		<td class="td1" width="160px"><b>活动成效材料</b><br/><label class='redcolor'>(可上传多个附件)</label></td>
          	<td class="td2" colspan="5">
          	名称：<input type="text" id="displayName" class="input_txt w_109"/>
            	<gw:fileUpload objectId="${bean.id}" rename="true"/>
          	</td>
          </tr>
          
    </table>
    
    <form:hidden path="bank.id"/>
    <form:hidden path="cost"/>
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
    var couponId="",totalcost=0,index=0;
  
    function listStatistic(){
    	totalcost=0;
    	
    	$("#cashApply_pannel tr:last").remove();
    	
    	if($("#cashApply_pannel tr:gt(0)").length>0){
    		 $.each($("#cashApply_pannel tr:gt(0)"),function(index,item){
    			 totalcost+=parseInt($(item).find('input').eq(8).val());
    		 });
    	}
    	var str="<tr>";
    	str+="<td colspan='4'><b>总计</b></td>";
    	str+="<td colspan='2'>总金额(元)</td>";
    	str+="<td  colspan='3'>"+totalcost+"</td>";
    	str+="</tr>";
    	$("#cost").val(totalcost);
    	$("#cashApply_pannel").append(str);
    }
    
    
    
    function doAction(type){
    	if(couponId==""){
			msg("请先添加需要兑现的科技券");
			return ;
		}
    	//提交时候的处理
    	if("send"==type){
    		if(index==0){
    			msg('请添加项目明细');
    			return;
    		}
    		if($("#bankId").text().length==0){
    			msg('请选择绑定的银行账户');
    			return;
    		}
    		$("#bank\\.id").val($("#bankId").text());
    		
    		//数据绑定
			doSubmit();
    	}
    	else if("add"==type){
    		var str="<tr>";
			 //str+="<td><input style='width:90%;' name='items["+index+"].meetingNumber' value='"+couponSeq+"' readonly='true'/></td>";
			 str+="<td class='hidePannel'><input   style='width:90%;' name='items["+index+"].applyId' value='"+couponId+"'/></td>";
			 str+="<td><input style='width:90%;' name='items["+index+"].number' value='"+index+"' readonly='true'/></td>";
			 str+="<td><input style='width:90%;' name='items["+index+"].company'/></td>";
			 str+="<td><input style='width:90%;' name='items["+index+"].invoiceCode'/></td>";
			 str+="<td><input style='width:90%;' name='items["+index+"].invoiceNumber'/></td>";
			 str+="<td><input onclick='timeSel(this)' style='width:90%;' name='items["+index+"].invoiceDate'/></td>";
			 str+="<td><input style='width:90%;' name='items["+index+"].invoiceMoney'/></td>";
			 str+="<td>";
			 str+="<select style='width:90%;' onchange='itemSelChange(this)'></select><input class='hidePannel' name='items["+index+"].content'/></td>";
			 //<input style='width:90%;' name='items["+index+"].content'/></td>";
			 str+="<td><input style='width:90%;' name='items["+index+"].money'/></td>";
			 str+="<td><div><a href='javascript:void(0)' onclick='doItemSave(this)'>确定</a><a href='javascript:void(0)' onclick='doItemDel(this)'>删除</a></div></td>";
			 str+="</tr>";
			 $(str).insertBefore($("#cashApply_pannel tr:last"));
			 index++;
			 
			 addSelectItems($("#cashApply_pannel tr:last").prev());
    	}
    }
    
    function addSelectItems(item){
    	var tr=$(item);
    	var content="<option value=''>--请选择--</option>";
    	$.get(base + '/sys/lookups/ajGetLookups.htm', {cate:'ZCLX'}, function (data) {
    		$.each(data,function(ind,obj){
    			content+="<option value='"+obj.lCode+"'>"+obj.lName+"</option>"
    		});
    		tr.find('select').html(content);
    	},'json');
    }
    
    function itemSelChange(item){
    	var value=$(item).val();
    	if(value!='')
    		$(item).next().val(value);
    }
    
    function timeSel(item){
		$(item).bind('click', WdatePicker);
	}
    
    
    function doItemSave(item){
    	if(!checkComplete($(item).closest('tr'))){
			msg("信息填写不完整或日期格式,金额格式不正确");
			return ;
		}
    	listStatistic();
    	$(item).closest('tr').find('input').attr('readonly','true');
    	$(item).closest('tr').find('select').attr('readonly','true');
    	$(item).remove();
    	
    }
    
    function doItemDel(item){
    	$(item).closest('tr').remove();
    	listStatistic();
    	index--;
    	
    	$("#cashApply_pannel").find('tr:gt(0)').each(function(ind,obj){
    		$(obj).find("input").eq(1).val(ind);
    	});
    }
    
    function checkComplete(item){
    	var datePatter = /^(\d{4})-(\d{1,2})-(\d{1,2})$/;
		var flag=true;
		$.each($(item).find("input"),function(index,obj){
			if($(obj).val()==""){
				flag=false;
			}
			//必须填写日期
			if(5==index){
				if(!datePatter.test($(obj).val())){
					flag=false;
				}
			}
			//必须是数字
			if(6==index||8==index){
				if(isNaN($(obj).val())){
					flag=false;
				}
			}
		});
		return flag;
    	
    }
    $(function(){
    	
    })
</script>
</body>
</html>
