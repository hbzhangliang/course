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
      <form:hidden path="initialized"/>
      <!--list start-->
      <a href="javascript:void(0);" class="table_head">>>会场提供商编辑<span onclick="movePanel('panel1')"></span></a>
      <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
        <tr>
          <td class="td1"><b>企业名称</b></td>
          <td class="td2">
            <c:if test="${currentUser.type eq 'serviceProvider'}">
              <form:input path="name" cssClass="input_txt w_209" readonly="true"/>
            </c:if>
            <c:if test="${!(currentUser.type eq 'serviceProvider')}">
              <form:input path="name" cssClass="input_txt w_209"/>
            </c:if>
          </td>
          <td class="td1"><b>账号</b></td>
          <td class="td2">
            <c:if test="${currentUser.type eq 'serviceProvider'}">
              <form:input path="account" cssClass="input_txt w_209" readonly="true"/>
            </c:if>
            <c:if test="${!(currentUser.type eq 'serviceProvider')}">
              <form:input path="account" cssClass="input_txt w_209"/>
            </c:if>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>联系人</b></td>
          <td class="td2">
            <form:input path="contact" cssClass="input_txt w_209"/>
          </td>
          <td class="td1"><b>联系电话</b></td>
          <td class="td2">
            <form:input path="tel" cssClass="input_txt w_209"/>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>电子邮件</b></td>
          <td class="td2" colspan="3">
            <form:input path="email" cssClass="input_txt w_440"/>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>地址</b></td>
          <td class="td2" colspan="3">
            <form:input path="address" cssClass="input_txt w_440"/>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>简介</b></td>
          <td class="td2" colspan="3">
            <form:textarea path="description" cssClass="input_txt w_690" cols="80" rows="5"/>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>交通情况</b></td>
          <td class="td2" colspan="3">
            <form:textarea path="trafficInfo" cssClass="input_txt w_690" cols="80" rows="5"/>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>服务信息</b></td>
          <td class="td2" colspan="3">
            <form:textarea path="serviceInfo" cssClass="input_txt w_690" cols="80" rows="5"/>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>餐饮信息</b></td>
          <td class="td2" colspan="3">
            <form:textarea path="repastInfo" cssClass="input_txt w_690" cols="80" rows="5"/>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>酒店信息</b></td>
          <td class="td2" colspan="3">
            <form:textarea path="hotelInfo" cssClass="input_txt w_690" cols="80" rows="5"/>
          </td>
        </tr>
      </table>
      <div class="an">
        <button type="button" onclick="doSubmit();" class="ico_tmpSave">
          <fmt:message key="sys.title.save"/></button>
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
  var requiredList = ["#name", "#account",];
</script>
</body>
</html>
