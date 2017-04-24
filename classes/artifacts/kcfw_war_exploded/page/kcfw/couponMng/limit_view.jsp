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
    </div>
    <!--bt end-->
    <!--table start-->
    <div class="hidePannel">
    <a href="javascript:void(0);" class="table_head">>>额度限定信息<span onclick="movePanel('panel1')"></span></a>
    <table border="1" cellspacing="0" cellpadding="0" class="table_list t_hs">
      	<tr>
      		<td></td>
      		<td colspan="4"><b>A券</b></td>
      		<td colspan="4"><b>B券</b></td>
      	</tr>
      	<tr>
      		<td width="15%"><b>企业</b></td>
      		<td class="td1">单次申请额(元)</td>
      		<td class="td2">
      			<fmt:formatNumber value="${limit.qy_sigle}" pattern="0" var="qy_sigle"/>
      			<label>${qy_sigle}</label>
      		</td>
      		<td class="td1">全年申请额(元)</td>
      		<td class="td2">
      			<fmt:formatNumber value="${limit.qy_fullyear}" pattern="0" var="qy_fullyear"/>
      			<label>${qy_fullyear}</label>
      		</td>
      		<td colspan="4"></td>
      		
      	</tr>
      	<tr>
      		<td><b>园区或众创空间运营方</b></td>
      		<td class="td1">单次申请额(元)</td>
      		<td class="td2">
      			<fmt:formatNumber value="${limit.kj_sigleA}" pattern="0" var="kj_sigleA"/>
      			<label>${kj_sigleA}</label>
      		</td>
      		<td class="td1">全年申请额(元)</td>
      		<td class="td2">
      			<fmt:formatNumber value="${limit.kj_fullyearA}" pattern="0" var="kj_fullyearA"/>
      			<label>${kj_fullyearA}</label>
      		</td>
      		<td class="td1">单次申请额(元)</td>
      		<td class="td2">
      			<fmt:formatNumber value="${limit.kj_sigleB}" pattern="0" var="kj_sigleB"/>
      			<label>${kj_sigleB}</label>
      		</td>
      		<td class="td1">全年申请额(元)</td>
      		<td class="td2">
      			<fmt:formatNumber value="${limit.kj_fullyearB}" pattern="0" var="kj_fullyearB"/>
      			<label>${kj_fullyearB}</label>
      		</td>
      	</tr>
      	<tr>
      		<td rowspan="2"><b>功能服务性机构</b></td>
      		<td width="12%" class="td1">单次申请额(元)</td>
      		<td width="8%" class="td2">
      			<fmt:formatNumber value="${limit.jg_sigleA}" pattern="0" var="jg_sigleA"/>
      			<label>${jg_sigleA}</label>
      		</td>
      		<td width="12%" class="td1">全年申请额(元)</td>
      		<td width="8%" class="td2">
      			<fmt:formatNumber value="${limit.jg_fullyearA}" pattern="0" var="jg_fullyearA"/>
      			<label>${jg_fullyearA}</label>
      		</td>
      		<td width="12%" class="td1">单次申请额(元)</td>
      		<td width="8%" class="td2">
      			<fmt:formatNumber value="${limit.jg_sigleB}" pattern="0" var="jg_sigleB"/>
      			<label>${jg_sigleB}</label>
      		</td>
      		<td width="12%" class="td1">全年申请额(元)</td>
      		<td width="8%" class="td2">
      			<fmt:formatNumber value="${limit.jg_fullyearB}" pattern="0" var="jg_fullyearB"/>
      			<label>${jg_fullyearB}</label>
      		</td>
      	</tr>
      	
    </table>
    </div>
    <a style="margin-top: 10px;" href="javascript:void(0);" class="table_head">>>本企业额度信息<span onclick="movePanel('panel1')"></span></a>
    <table id="limitTable" border="1" cellspacing="0" cellpadding="0" class="table_list t_hs">
    	<tr>
    		<td width="16%">企业名称</td>
    		<td width="14%">企业性质认定</td>
    		<td colspan="2">A券</td>
    		<td colspan="2">B券</td>
    	</tr>
    	<tr>
    		<td rowspan="3">${corp.unitName}</td>
    		<td rowspan="3"><gw:lookups category="${lookups_QYLX}" lookupsCode="${corp.funcClassify}"/></td>
    		<td class="td1">总申请科技券(张)</td>
    		<td class="td2"><label>${acorpUsage.amount}</label></td>
    		<td colspan="2" class="td2"></td>
    	</tr>
    	<tr>
    		<td class="td1">
    			申请总额(元)
    		</td>
    		<td class="td2" id="acost">
    			<fmt:formatNumber value="${acorpUsage.cost}" pattern="0" var="acorpUsage_cost"/>
    			<label>${acorpUsage_cost}</label>
    		</td>
    		<td width="10%" class="td1">
    			申请总额(元)
    		</td>
    		<td width="10%" class="td2" id="bcost">
    			<fmt:formatNumber value="${bcorpUsage.cost}" pattern="0" var="bcorpUsage_cost"/>
    			<label>${bcorpUsage_cost}</label>
    		</td>
    		<tr>
	    		<td width="15%" class="td1">
	    			余额(元)
	    		</td>
	    		<td width="10%" class="td2" id="aremain">
	    		</td>
	    		<td width="15%" class="td1">
	    			余额(元)
	    		</td>
	    		<td width="10%" class="td2" id="bremain">
	    		</td>
    	</tr>
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
  function initPage(){
	  var funcClassify="${corp.funcClassify}";
	  var totalA,totalB;
	  if("orgUser"==funcClassify){
		  totalA="${limit.jg_fullyearA}";
		  totalB="${limit.jg_fullyearB}";
	  }
	  else if("parkUser"==funcClassify){
		  totalA="${limit.kj_fullyearA}";
		  totalB="${limit.kj_fullyearB}";
	  }
	  else{
		  totalA="${limit.qy_fullyear}";
		  totalB="${limit.qy_fullyear}";
	  }
	  
	  $("#aremain").text(parseInt(totalA)-emptyParse($("#acost").text()));
	  $("#bremain").text(parseInt(totalB)-emptyParse($("#bcost").text()));
	  
	  //如果是企业用户,B券的信息不显示
	  if("corpUser"=="${corp.funcClassify}"){
		  $.each($("#limitTable").find('tr'),function(index,item){
			  if(index<2){
				  $(item).find("td:last").hide(10);
			  }
			  else{
				  $(item).find("td:last").hide(10);
				  $(item).find("td:last").prev().hide(10);
			  }
		  });
	  }
	  
  }
  function emptyParse(str){
	  return isNaN(parseInt(str))?0:parseInt(str);
  }
  $(function(){
	  initPage();
  })
</script>

</body>
</html>
