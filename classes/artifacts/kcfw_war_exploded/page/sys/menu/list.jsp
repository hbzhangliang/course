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
            <gw:list_opt opt="b,n,r,s,c" id="lot"/>
            <b>
              <div class="sys_title"></div>
              <span><fmt:message key="sys.title.menuMng"/></span></b>
          </div>
          <!--tit end-->
          <form:form modelAttribute="queryBean" method="post" action="list.htm" id="searchForm">
            <c:import url="../../../include/pageParams.jsp"/>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_1">
              <tr>
                <th scope="row" width="15%">模块名称</th>
                <td><form:input path="params[module.name]" cssClass="input" size="28"/></td>
                <th scope="row" width="15%">模块代码</th>
                <td><form:input path="params[module.code]" cssClass="input" size="28"/></td>
              </tr>
              <tr>
                <th scope="row" width="15%">栏目名称</th>
                <td><form:input path="params[name]" cssClass="input" size="28"/></td>
                <th scope="row" width="15%">栏目代码</th>
                <td><form:input path="params[code]" cssClass="input" size="28"/></td>
              </tr>
            </table>
          </form:form>
          <div class="bg clearfix">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tablelist">
              <thead>
              <tr>
                <th scope="col" width="4%">排序</th>
                <th scope="col" width="10%">模块名称</th>
                <th scope="col" width="10%">栏目名称</th>
                <th scope="col" width="10%">栏目代码</th>
                <th scope="col" width="18%">访问路径</th>
                <th scope="col">权限点</th>
                <th scope="col" width="10%">父栏目</th>
                <th scope="col" width="15%"><fmt:message key="sys.title.operation"/></th>
              </tr>
              </thead>
              <tbody id="content">
              <c:forEach items="${list}" var="bean">
                <tr id="tr_${bean.id}">
                  <td>${bean.seq}</td>
                  <td>${bean.module.name}</td>
                  <td>${bean.name}</td>
                  <td>${bean.code}</td>
                  <td>${bean.url}</td>
                  <td>${bean.aclKey}</td>
                  <td>${bean.parent.name}</td>
                  <td>
                    <gw:operation opt="e,d,v"/>
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
  $('.opt_fun').attr('title', '<fmt:message key="sys.title.initMenuAcl"/>')
      .bind('click', function () {
        $.post('ajInitMenuAcl.htm', null, function () {
          msg('<fmt:message key="sys.title.initMenuAclOK"/>');
        });
      });
</script>
</body>
</html>
