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
      <form:hidden path="regDate"/>
      <form:hidden path="activated"/>
      <div class="tit_1">
        <gw:list_opt opt="rt,ok" id="lot"/>
        <b>
          <div class="sys_title"></div>
          <span><fmt:message key="sys.title.moduleMng"/> </span>
        </b>
      </div>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_1">
        <tr>
          <th scope="row" width="15%">模块名称</th>
          <td><form:input cssClass="input" size="27" path="name"/></td>
        </tr>
        <tr>
          <th scope="row">模块代码</th>
          <td><form:input path="code" cssClass="input" size="27"/></td>
        </tr>
        <tr>
          <th scope="row">排序号</th>
          <td><form:input path="seq" cssClass="input" size="27"/></td>
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
  var checkDupl = ['#code', '#name', '#seq'];
</script>
</body>
</html>
