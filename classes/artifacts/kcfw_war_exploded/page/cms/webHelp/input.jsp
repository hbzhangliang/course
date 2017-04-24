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
      <form:hidden path="params[question]"/>
      <div class="tit_1">
        <gw:list_opt opt="rt,ok" id="lot"/>
        <b>
          <div class="sys_title"></div>
          <span><fmt:message key="sys.title.webHelpMng"/> </span></b>
      </div>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_1">
        <tr>
          <th scope="row" width="15%">所属模块</th>
          <td>
            <form:select path="section.id" cssClass="input_txt w_209">
                <form:option value="" label="--请选择--"/>
               <c:forEach items="${sections}" var="item">
                 <form:option value="${item.id}">${item.name}</form:option>
               </c:forEach>
            </form:select>
          </td>
        </tr>
        <tr>
          <th scope="row" width="15%">问题</th>
          <td><form:textarea path="question" cols="80" rows="5"/></td>
        </tr>
        <tr>
          <th scope="row" width="15%">回答</th>
          <td><form:textarea path="answer" cols="80" rows="5"/></td>
        </tr>
      </table>
    </form:form>
    <c:import url="../commons/footer.jsp"/>
  </div>
</div>
</body>
</html>
