<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_sys.jsp" %>
</head>
<body>
<div class="warp clearfix">
  <div class="wrap_no_left clearfix">
    <!--top start-->
    <c:import url="../commons/top.jsp"/>
    <!--top start-->
    <form:form modelAttribute="bean" action="save.htm" method="post" id="form">
      <c:import url="../../../include/pageParams.jsp"/>
      <form:hidden path="params[lName]"/>
      <form:hidden path="params[parent.cName]"/>
      <div class="tit_1">
        <gw:list_opt opt="rt,ok" id="lot"/>
        <b>
          <div class="sys_title"></div>
          <span><fmt:message key="sys.title.lookupsMng"/> </span></b>
      </div>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_1">
        <tr>
          <th scope="row">所属模块</th>
          <td>
            <form:select path="module.id" onchange="getLookupsByModule();">
              <form:option value="" label="--请选择--"/>
              <form:options items="${moduleList}" itemValue="id" itemLabel="name"/>
            </form:select>
          </td>
        </tr>
        <tr>
          <th scope="row" width="15%">字典类名称</th>
          <td><form:input cssClass="input" size="27" path="cName"/></td>
        </tr>
        <tr>
          <th scope="row">字典类代码</th>
          <td><form:input path="cCode" cssClass="input" size="27"/></td>
        </tr>
        <tr>
          <th scope="row">字典项名称</th>
          <td><form:input path="lName" cssClass="input" size="27"/></td>
        </tr>
        <tr>
          <th scope="row">字典项代码</th>
          <td><form:input path="lCode" cssClass="input" size="27"/></td>
        </tr>
        <tr>
          <th scope="row">排序号</th>
          <td><form:input path="seq" cssClass="input" size="27"/></td>
        </tr>
        <tr>
          <th scope="row">所属字典类：</th>
          <td>
            <form:select path="parent.id">
              <form:option value="" label="--请选择--"/>
              <form:options items="${cateList}" itemValue="id" itemLabel="cName"/>
            </form:select>
          </td>
        </tr>
        <tr>
          <th scope="row" style=" vertical-align:top;">备注</th>
          <td><form:textarea path="description" cols="80" rows="10"/></td>
        </tr>
      </table>
    </form:form>
    <c:import url="../commons/footer.jsp"/>
  </div>
</div>
<script>
  getLookupsByModule = function () {
    $("select[id='parent.id']").find("option[value!='']").remove();
    $.post('getLookupsByModule.htm', {
      moduleId: $("select[id='module.id']").val(),
      beanId: '${bean.id}'
    }, function (data) {
      if (data.success) {
        $.each(data.data, function (idx, obj) {
          if (data.parentId != null && data.parentId == obj.id)
            $("select[id='parent.id']").append("<option value='" + obj.id + "' selected='true'>" + obj.name + "</option>")
          else
            $("select[id='parent.id']").append("<option value='" + obj.id + "'>" + obj.name + "</option>")
        });
      }
    }, 'json');
  }

  getLookupsByModule();
</script>
</body>
</html>
