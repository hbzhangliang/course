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
      <form:hidden path="published"/>
      <form:hidden path="pinned"/>
      <form:hidden path="provider.id"/>
      <!--list start-->
      <a href="javascript:void(0);" class="table_head">>>会场信息编辑<span onclick="movePanel('panel1')"></span></a>
      <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
        <tr>
          <td class="td1"><b>会场提供商</b></td>
          <td class="td2">
            <form:input path="provider.name" cssClass="input_txt w_209" readonly="true"/>
          </td>
          <td class="td1"><b>会场名称</b></td>
          <td class="td2">
            <form:input path="name" cssClass="input_txt w_209"/>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>类型</b></td>
          <td class="td2">
            <form:select path="type" items="${lookups_HCLX}" itemLabel="lName" itemValue="lCode"/>
          </td>
          <td class="td1"><b>可容纳人数（人）</b></td>
          <td class="td2">
            <form:input path="capacity" cssClass="input_txt w_209"/>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>面积(平方米)</b></td>
          <td class="td2">
            <form:input path="area" cssClass="input_txt w_209"/>&nbsp;M<sup>2</sup>
          </td>
          <td class="td1"><b>高度（米）</b></td>
          <td class="td2">
            <form:input path="height" cssClass="input_txt w_209"/>&nbsp;M
          </td>
        </tr>
        <tr>
          <td class="td1"><b>基本设施</b></td>
          <td class="td2" colspan="3">
            <form:checkboxes path="lookupsIds" items="${lookups_HCSS}" itemLabel="lName" itemValue="id"/>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>适用于</b></td>
          <td class="td2" colspan="3">
            <form:textarea path="func" cssClass="input_txt w_690" cols="80" rows="5"/>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>可预约时间</b></td>
          <td class="td2" colspan="3">
            <form:textarea path="availableTime" cssClass="input_txt w_690" cols="80" rows="5"/>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>概述</b></td>
          <td class="td2" colspan="3">
            <form:textarea path="description" cssClass="input_txt w_690" cols="80" rows="5"/>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>价格信息</b></td>
          <td class="td2" colspan="3">
            <form:textarea path="priceDetail" cssClass="input_txt w_690" cols="80" rows="5"/>
          </td>
        </tr>
        <tr>
          <td class="td1"><b>会场图片</b><br/><label class='redcolor'>(可上传多个附件)</label></td>
          <td class="td2" colspan="3">
            <gw:fileUpload objectId="${bean.id}"/>
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
  var requiredList = ["#name", "#type",];

  if ('${bean.lookupsIds}'.length > 0) {
    $.each('${bean.lookupsIds}'.split(','), function (idx, obj) {
      $.each($("input[name='lookupsIds']"), function (idxx, objj) {
        if ($(objj).val() == obj)
          $(objj).prop('checked', true);
      });
    });
  }
</script>
</body>
</html>
