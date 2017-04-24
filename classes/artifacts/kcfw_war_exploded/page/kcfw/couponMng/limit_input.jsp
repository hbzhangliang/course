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
      <a href="javascript:void(0);" class="table_head">>>额度限定信息<span onclick="movePanel('panel1')"></span></a>
      <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
      	<tr>
          <td class="td1"><b>企业类型</b></td>
          <td class="td2">
          		<select id="isfuncSel" class="input_txt w_209">
          			<option value="">---</option>
          			<option value="0">一般企业</option>
          			<option value="1">功能服务性机构/园区、众创空间管理运营部</option>
          		</select>
          </td>
          <td class="td1"><b>科技券类别</b></td>
          <td class="td2">
          		<select id="couponTypeSel" class="input_txt w_209">
          			<option value="">---</option>
          			<option value="A券">A券</option>
          			<option value="B券">B券</option>
          		</select>
          </td>
      	<tr>
          <td class="td1"><b>限额性质</b></td>
          <td class="td2"><form:input path="property" cssClass="input_txt w_209"/></td>
          <td class="td1"><b>性质编码</b></td>
          <td class="td2">
            	<form:input path="properCode" cssClass="input_txt w_209"/>
          </td>
      	</tr>
      	<tr>
      		<td class="td1"><b>限定额度</b></td>
          	<td class="td2" colspan='3'><form:input path="limitLine" cssClass="input_txt w_209"/></td>
      	</tr>
      </table>  
      <div class="an">
        <button type="button" onclick="doSubmit();" class="ico_tmpSave">
          <fmt:message key="sys.title.save"/></button>
        <button type="button" onclick="history.back();" class="ico_return">
          <fmt:message key="sys.title.return"/></button>
      </div>
      <form:hidden path="isfunc" />
      <form:hidden path="couponType" />
    </form:form>
    
    </div>
  </div>
  <!--right end-->
<!--main end-->
<!--footer start-->
<c:import url="../../../include/footer.jsp"/>
<!--footer end-->
<script>
//   var requiredList = ["#enumeratename", "#ordernum"];
//   var intFields=["#ordernum"];
     function initPage(){
    	 var isfunc="${bean.isfunc}";
    	 var couponType="${bean.couponType}";
    	 var func;
    	 if(isfunc=="true"){
    		 func="1";
    	 }
    	 else if(isfunc=="false"){
    		 func="0";
    	 }
    	 else{
    		 func="";
    	 }
    	 $("#isfuncSel").val(func);
    	 $("#couponTypeSel").val(couponType);
     }
  $(function(){
	  initPage();
	  $("#isfuncSel,#couponTypeSel").change(function(){
		  var id=$(this).attr('id').replace("Sel","");
		  $("#"+id).val($(this).val());
	  });
  })
  
</script>
</body>
</html>
