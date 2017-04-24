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
              <span><fmt:message key="sys.title.moduleMng"/></span></b>
          </div>
          <!--tit end-->
          <form:form modelAttribute="queryBean" method="post" action="list.htm" id="searchForm">
            <c:import url="../../../include/pageParams.jsp"/>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_1">
              <tr>
                <th scope="row" width="15%">模块名称</th>
                <td><form:input path="params[name]" cssClass="input" size="28"/></td>
                <th scope="row" width="15%">模块代码</th>
                <td><form:input path="params[code]" cssClass="input" size="28"/></td>
              </tr>
            </table>
          </form:form>
          <div class="bg clearfix">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tablelist">
              <thead>
              <tr>
                <th scope="col">排序</th>
                <th scope="col">模块名称</th>
                <th scope="col">模块代码</th>
                <th scope="col">注册时间</th>
                <th scope="col">说明</th>
                <th scope="col">启用情况</th>
                <th scope="col" width="15%"><fmt:message key="sys.title.operation"/></th>
              </tr>
              </thead>
              <tbody id="content">
              <c:forEach items="${list}" var="bean">
                <tr id="tr_${bean.id}">
                  <td width="5%">${bean.seq}</td>
                  <td width="10%">${bean.name}</td>
                  <td width="10%">${bean.code}</td>
                  <td width="10%"><fmt:formatDate value="${bean.regDate}" pattern="yyyy-MM-dd"/></td>
                  <td>${bean.remark}</td>
                  <td width="10%">${bean.activated}</td>
                  <td width="10%">
                    <gw:operation opt="c,e,d"/>
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
  $.each($(".opt_fun"), function () {
    var objId = $(this).parent().parent().parent().attr('id').substr(3);
    var statusField = $(this).parent().parent().prev();
    $(this).attr('title', statusField.html() == 'true' ? '禁用' : '启用').bind('click', function () {
      statusField.html(statusField.html() == 'true' ? 'false' : 'true');
      $(this).attr('title', statusField.html() == 'true' ? '禁用' : '启用');
      $.post('active.htm', {
        id: objId,
        activated: statusField.html() == 'true'
      }, function (data) {
        msg(data);
      })
    });
  });
</script>
</body>
</html>
