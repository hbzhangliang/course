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
      <form:hidden path="params[parent.name]"/>
      <div class="tit_1">
        <gw:list_opt opt="rt,ok" id="lot"/>
        <b>
          <div class="sys_title"></div>
          <span><fmt:message key="sys.title.deptMng"/> </span></b>
      </div>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_1">
        <tr>
          <th scope="row" width="15%">部门名称</th>
          <td><form:input cssClass="input" size="27" path="name"/></td>
        </tr>
        <tr>
          <th scope="row">所属部门</th>
          <td>
            <form:input cssClass="input" size="24" readonly="true" path="parent.name"/>
            <form:hidden path="parent.id"/>
          </td>
        </tr>
        <tr>
          <th scope="row">显示顺序</th>
          <td><form:input path="seq" cssClass="input" size="27"/></td>
        </tr>
      </table>
    </form:form>
    <c:import url="../commons/footer.jsp"/>
  </div>
</div>
</body>
</html>
