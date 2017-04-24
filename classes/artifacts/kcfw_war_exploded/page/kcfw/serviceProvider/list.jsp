<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_default.jsp" %>
</head>
<body>
<!--top start-->
<c:import url="../../../include/top.jsp"/>
<!--top end-->
<!--main start-->
<div class="main clearfix">
  <!--left start-->
  <div class="left" id="wrapper-250">
    <c:import url="../../../include/menu.jsp"/>
  </div>
  <!--left end-->
  <!--right start-->
  <div class="right clearfix">
    <!--bread_crumbs start-->
    <c:import url="../../../include/navigation.jsp"/>
    <!--bread_crumbs end-->
    <div class="an">
      <gw:bizSearch fields="企业名称" path="name" opts="add,del"/>
    </div>
    <!--bt end-->
    <gw:pagination mode="biz"/>
    <!--table start-->
    <table class="table_01">
      <tr>
        <th width="5%"><input type="checkbox" id="selectAll" title="<fmt:message key="sys.title.selectAll"/>"/></th>
        <th class="orderBy">企业名称</th>
        <th width="15%">联系人</th>
        <th width="15%">联系电话</th>
        <th width="15%">账号</th>
        <th width="12%"><fmt:message key="biz.title.operation"/></th>
      </tr>
      <c:forEach items="${list}" var="bean" varStatus="i">
        <tr id="tr_${bean.id}">
          <td><input class="chk" type="checkbox" id="chk_${bean.id}"/></td>
          <td>${bean.name}</td>
          <td>${bean.contact}</td>
          <td>${bean.tel}</td>
          <td>${bean.account}</td>
          <td>
            <gw:operation mode="biz" opt="e,d"/>
            <c:if test="${!bean.initialized}">
              <a href="javascript:void(0)" onclick="initAccount('${bean.id}')">初始化账号</a>
            </c:if>
          </td>
        </tr>
      </c:forEach>
    </table>
    <!--table end-->
    <!--right end-->
  </div>
</div>
<!--main end-->
<!--footer start-->
<c:import url="../../../include/footer.jsp"/>
<!--footer end-->
<script>
  initAccount = function (_id) {
    $.post('initAccount.htm', {id: _id}, function (data) {
      msg(data);
    });
  }
</script>
</body>
</html>
