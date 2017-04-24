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
              <span><fmt:message key="sys.title.configMng"/> </span>
            </b>
          </div>
          <!--tit end-->
          <form:form modelAttribute="queryBean" method="post" action="list.htm" id="searchForm">
            <c:import url="../../../include/pageParams.jsp"/>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_1">
              <tr>
                <th scope="row" width="15%">配置键</th>
                <td><form:input path="params[cfgKey]" cssClass="input" size="24"/></td>
                <th scope="row" width="15%">配置值</th>
                <td><form:input path="params[cfgValue]" cssClass="input" size="24"/></td>
              </tr>
            </table>
          </form:form>
          <div class="bg clearfix">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tablelist">
              <thead>
              <tr>
                <th scope="col">配置键</th>
                <th scope="col">配置值</th>
                <th scope="col">上次值</th>
                <th scope="col">备注</th>
                <th scope="col" width="15%"><fmt:message key="sys.title.operation"/></th>
              </tr>
              </thead>
              <tbody id="content">
              <c:forEach items="${list}" var="bean">
                <tr id="tr_${bean.id}">
                  <td>${bean.cfgKey}</td>
                  <td>${bean.cfgValue}</td>
                  <td>${bean.lastValue}</td>
                  <td>${bean.remark}</td>
                  <td>
                    <gw:operation opt="e"/>
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
