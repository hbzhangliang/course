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
    <form:form action="save.htm" method="post" modelAttribute="bean" id="form">
    <!--bt end-->
    <!--table start-->
    <a href="javascript:void(0);" class="table_head">>>额度限定设置<span onclick="movePanel('panel1')"></span></a>
    <table border="1" cellspacing="0" cellpadding="0" class="table_list t_hs">
      	<tr>
      		<td ></td>
      		<td colspan="2"><b>A券</b></td>
      		<td colspan="2"><b>B券</b></td>
      	</tr>
      	<tr>
      		<td width="15%" rowspan="2"><b>企业</b></td>
      		<td width="15%" class="td1">单次申请额(元)</td>
      		<td width="15%" class="td2">
      			<fmt:formatNumber value="${bean.qy_sigle}" pattern="0" var="qy_sigle"/>
				<form:input path="qy_sigle" cssClass="input_txt w_209" value="${qy_sigle}"/>
      		</td>
      		<td colspan="2"></td>
      	</tr>
      	<tr>
      		<td class="td1">全年申请额(元)</td>
      		<td class="td2">
      			<fmt:formatNumber value="${bean.qy_fullyear}" pattern="0" var="qy_fullyear"/>
      			<form:input path="qy_fullyear" cssClass="input_txt w_209" value="${qy_fullyear}"/>
      		</td>
      		<td colspan="2"></td>
      	</tr>
      	<tr>
      		<td rowspan="2"><b>园区或众创空间运营方</b></td>
			<td class="td1">单次申请额(元)</td>
      		<td class="td2">
      			<fmt:formatNumber value="${bean.kj_sigleA}" pattern="0" var="kj_sigleA"/>
      			<form:input path="kj_sigleA" cssClass="input_txt w_209" value="${kj_sigleA}"/>
      		</td>
      		<td class="td1">单次申请额(元)</td>
      		<td class="td2">
      			<fmt:formatNumber value="${bean.kj_sigleB}" pattern="0" var="kj_sigleB"/>
      			<form:input path="kj_sigleB" cssClass="input_txt w_209" value="${kj_sigleB}"/>
      		</td>
      	</tr>
      	<tr>
      		<td class="td1">全年申请额(元)</td>
      		<td class="td2">
      			<fmt:formatNumber value="${bean.kj_fullyearA}" pattern="0" var="kj_fullyearA"/>
      			<form:input path="kj_fullyearA" cssClass="input_txt w_209" value="${kj_fullyearA}"/>
      		</td>
      		<td class="td1">全年申请额(元)</td>
      		<td class="td2">
      			<fmt:formatNumber value="${bean.kj_fullyearB}" pattern="0" var="kj_fullyearB"/>
      			<form:input path="kj_fullyearB" cssClass="input_txt w_209" value="${kj_fullyearB }"/>
      		</td>
      	</tr>
      	<tr>
      		<td rowspan="2"><b>功能服务性机构</b></td>
			<td class="td1">单次申请额(元)</td>
      		<td class="td2">
      			<fmt:formatNumber value="${bean.jg_sigleA}" pattern="0" var="jg_sigleA"/>
      			<form:input path="jg_sigleA" cssClass="input_txt w_209" value="${jg_sigleA}"/>
      		</td>
      		<td class="td1">单次申请额(元)</td>
      		<td class="td2">
      			<fmt:formatNumber value="${bean.jg_sigleB}" pattern="0" var="jg_sigleB"/>
      			<form:input path="jg_sigleB" cssClass="input_txt w_209" value="${jg_sigleB}"/>
      		</td>
      	</tr>
      	<tr>
      		<td class="td1">全年申请额(元)</td>
      		<td class="td2">
      			<fmt:formatNumber value="${bean.jg_fullyearA}" pattern="0" var="jg_fullyearA"/>
      			<form:input path="jg_fullyearA" cssClass="input_txt w_209" value="${jg_fullyearA}"/>
      		</td>
      		<td class="td1">全年申请额(元)</td>
      		<td class="td2">
      			<fmt:formatNumber value="${bean.jg_fullyearB}" pattern="0" var="jg_fullyearB"/>
      			<form:input path="jg_fullyearB" cssClass="input_txt w_209" value="${jg_fullyearB }"/>
      		</td>
      	</tr>
      	<tr>
      		<td></td>
      		<td class="td1">A券单张额度(元)</td>
      		<td class="td2" colspan="3"><form:input path="couponMoney" cssClass="input_txt w_209"/> </td>
      	</tr>
    </table>
    <form:hidden path="id"/>
    <div class="an">
        <button type="button" onclick="doSubmit();" class="ico_tmpSave">
          <fmt:message key="sys.title.save"/></button>
        <button id="btnClear" type="button"  class="ico_trash">
          清除</button>
      </div>
      </form:form>
    <!--table end-->
  <!--right end-->
  </div>
</div>
<!--main end-->
<!--footer start-->
<c:import url="../../../include/footer.jsp"/>
<!--footer end-->
<script> 
  $(function(){
	  $("#btnClear").click(function(){
		  $(":text").val("");
	  });
  })
</script>

</body>
</html>
