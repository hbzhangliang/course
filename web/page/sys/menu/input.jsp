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
      <form:hidden path="params[name]"/>
      <form:hidden path="params[code]"/>
      <form:hidden path="params[module.name]"/>
      <form:hidden path="params[module.code]"/>
      <div class="tit_1">
        <gw:list_opt opt="rt,ok" id="lot"/>
        <b>
          <div class="sys_title"></div>
          <span><fmt:message key="sys.title.menuMng"/> </span>
        </b>
      </div>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_1">
        <tr>
          <th scope="row">所属模块</th>
          <td>
            <form:select path="module.id" onchange="getMenuByModule();">
              <form:option value="" label="--请选择--"/>
              <form:options items="${moduleList}" itemValue="id" itemLabel="name"/>
            </form:select>
          </td>
        </tr>
        <tr>
          <th scope="row" width="15%">栏目名称</th>
          <td><form:input cssClass="input" size="27" path="name"/></td>
        </tr>
        <tr>
          <th scope="row">栏目代码</th>
          <td><form:input path="code" cssClass="input" size="27"/></td>
        </tr>
        <tr>
          <th scope="row">权限代码</th>
          <td><form:input path="aclKey" cssClass="input" size="27"/></td>
        </tr>
        <tr>
          <th scope="row">访问路径</th>
          <td><form:input path="url" cssClass="input" size="27"/></td>
        </tr>
        <tr>
          <th scope="row">排序号</th>
          <td><form:input path="seq" cssClass="input" size="27"/></td>
        </tr>
        <tr>
          <th scope="row">所属栏目</th>
          <td>
            <form:select path="parent.id">
              <form:option value="" label="--请选择--"/>
            </form:select>
          </td>
        </tr>
        <tr>
          <th scope="row" style=" vertical-align:top;">备注</th>
          <td><form:textarea path="remark" cols="80" rows="10"/></td>
        </tr>
      </table>
    </form:form>
    <c:import url="../commons/footer.jsp"/>
  </div>
</div>
<script>
  getMenuByModule = function () {
    $("select[id='parent.id']").find("option[value!='']").remove();
    $.post('getMenuByModule.htm', {
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

  getMenuByModule();
</script>
</body>
</html>
