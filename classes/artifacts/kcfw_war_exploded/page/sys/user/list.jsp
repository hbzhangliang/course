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
              <span><fmt:message key="sys.title.userMng"/> </span>
            </b>
          </div>
          <!--tit end-->
          <form:form modelAttribute="queryBean" method="post" action="list.htm" id="searchForm">
            <c:import url="../../../include/pageParams.jsp"/>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_1">
              <tr>
                <th scope="row" width="15%">真实姓名</th>
                <td><form:input path="params[realName]" cssClass="input" size="24" width="35%"/></td>
                <th scope="row" width="15%">所属部门</th>
                <td><form:input path="params[depart.name]" cssClass="input" size="24"/></td>
              </tr>
            </table>
          </form:form>
          <div class="bg clearfix">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tablelist">
              <thead>
              <tr>
                <th scope="col">用户名</th>
                <th scope="col">真实姓名</th>
                <th scope="col">单位</th>
                <th scope="col">部门</th>
                <th scope="col" width="18%">
                  <fmt:message key="sys.title.operation"/>
                </th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${list}" var="bean">
                <tr id="tr_${bean.id}">
                  <td>${bean.account}</td>
                  <td>${bean.realName}</td>
                  <td>${bean.depart.name}</td>
                  <td>${bean.depart.name}</td>
                  <td>
                    <gw:operation opt="v"/>
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
<script>
  $('.opt_fun').attr('title', '<fmt:message key="sys.title.resetPwd"/>').bind('click', function () {
    $.post('resetPwdById.htm', {id: $(this).attr('id').substr(4) + ''}, function (data) {
      msg(data);
    });
  });
</script>
</body>
</html>
