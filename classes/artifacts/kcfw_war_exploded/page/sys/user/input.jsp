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
    <form:form modelAttribute="bean" action="save.htm" method="post" id="form">
      <c:import url="../../../include/pageParams.jsp"/>
      <form:hidden path="pwd"/>
      <form:hidden path="cGuid"/>
      <!--top start-->
      <div class="tit_1">
        <gw:list_opt opt="rt,ok" id="lot"/>
        <b>
          <div class="sys_title"></div>
          <span><fmt:message key="sys.title.userMng"/></span>
        </b>
      </div>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_1">
        <tr>
          <th scope="row" width="15%">用户名</th>
          <td><form:input cssClass="input" size="27" path="cLoginId"/></td>
        </tr>
        <tr>
          <th scope="row">真实姓名</th>
          <td><form:input cssClass="input" size="27" path="realName"/></td>
        </tr>
        <tr>
          <th scope="row">第一组织机构</th>
          <td>
            <form:input cssClass="input" size="27" path="depart.name"/>
            <form:hidden path="depart.id"/>
          </td>
        </tr>
        <tr>
          <th scope="row">其他部门</th>
          <td>
            <form:input cssClass="input" size="27" path="otherDeptNames"/>
          </td>
        </tr>
      </table>
    </form:form>
    <c:import url="../commons/footer.jsp"/>
  </div>
</div>
</body>
<script>
  var requiredList = ['#cLoginId', '#realName', '#depart.name'];
</script>
</html>
