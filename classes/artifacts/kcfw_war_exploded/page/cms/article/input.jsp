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
      <c:import url="../../../include/businessEntityParams.jsp"/>
      <form:hidden path="author.id"/>
      <form:hidden path="createDate"/>
      <form:hidden path="params[sectionId]"/>
      <div class="tit_1">
        <gw:list_opt opt="rt,ok" id="lot"/>
        <b>
          <div class="sys_title"></div>
          <span><fmt:message key="cms.label.articleEdit"/> </span></b>
      </div>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_1">
        <tr>
          <th scope="row" width="15%">标题</th>
          <td><form:input path="title" size="100" maxlength="100"/></td>
        </tr>
        <tr>
          <th scope="row" width="15%">副标题</th>
          <td><form:input path="subtitle" size="100" maxlength="100"/></td>
        </tr>
        <tr>
          <th scope="row" width="15%">摘要</th>
          <td><form:textarea path="summary" cols="80" rows="5"/></td>
        </tr>
        <tr>
          <th scope="row" width="15%">是否置顶</th>
          <td><form:select path="pinned" items="${lookups_YN}" itemLabel="lName" itemValue="lCode"/></td>
        </tr>
        <tr>
          <th scope="row" width="15%">是否发布</th>
          <td><form:select path="published" items="${lookups_YN}" itemLabel="lName" itemValue="lCode"/></td>
        </tr>
        <tr>
          <th scope="row" width="15%">内容</th>
          <td>
            <c:if test="${!(bean.op eq 'v')}">
              <form:hidden path="content"/>
              <c:import url="../../../ueditor1.4.3/index.jsp"/>
            </c:if>
            <c:if test="${bean.op eq 'v'}">
              <div class="mainTxtdiv">${bean.mainText}</div>
            </c:if>
          </td>
        </tr>
      </table>
    </form:form>
    <c:import url="../commons/footer.jsp"/>
  </div>
</div>
</body>
</html>
