<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_sys.jsp" %>
</head>
<body>
<div class="warp clearfix">
  <div class="warp_in clearfix">
    <!--top start-->
    <c:import url="../commons/top.jsp"/>
    <!--top start-->
    <div class="main">
      <c:import url="../commons/menu.jsp"/>
      <!--tit start-->
      <div class="right clearfix">
        <div class="right_ineer clearfix">
          <div class="tit_1">
            <gw:list_opt opt="b,n,r,s" id="lot"/>
            <b>
              <div class="sys_title"></div>
              <span><fmt:message key="sys.title.lookupsMng"/> </span>
            </b>
          </div>
          <!--tit end-->
          <form:form modelAttribute="queryBean" method="post" action="list.htm" id="searchForm">
            <c:import url="../../../include/pageParams.jsp"/>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_1">
              <tr>
                <th scope="row" width="15%">所属模块</th>
                <td><form:input path="params[module.name]" cssClass="input" size="24"/></td>
                <th scope="row" width="15%">字典类型</th>
                <td><form:input path="params[parent.cName]" cssClass="input" size="24"/></td>
                <th scope="row" width="15%">字典项名称</th>
                <td><form:input path="params[lName]" cssClass="input" size="24"/></td>
              </tr>
            </table>
          </form:form>
          <div class="bg clearfix">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tablelist">
              <thead>
              <tr>
                <th scope="col">所属模块</th>
                <th scope="col">字典类型</th>
                <th scope="col">字典编号</th>
                <th scope="col">字典项名称</th>
                <th scope="col">字典项编号</th>
                <th scope="col">所属类型</th>
                <th scope="col" width="15%"><fmt:message key="sys.title.operation"/></th>
              </tr>
              </thead>
              <tbody id="content">
              <c:forEach items="${list}" var="bean">
                <tr id="tr_${bean.id}">
                  <td>${bean.module.name}</td>
                  <td>${bean.cName}${bean.parent.cName}</td>
                  <td>${bean.cCode}${bean.parent.cCode}</td>
                  <td>${bean.lName}</td>
                  <td>${bean.lCode}</td>
                  <td>${bean.parent.cName}</td>
                  <td>
                    <gw:operation opt="e,d"/>
                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
            <br/>
            <gw:pagination mode="sys"/>
          </div>
        </div>
      </div>
    </div>
    <c:import url="../commons/footer.jsp"/>
  </div>
</div>
</body>
</html>
