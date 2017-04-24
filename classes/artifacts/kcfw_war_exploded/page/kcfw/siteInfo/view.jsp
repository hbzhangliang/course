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
      <gw:bizSearch fields="会场名称" path="name" opts="add,del"/>
    </div>
    <!--bt end-->
    <gw:pagination mode="biz"/>
    <!--table start-->
    <table class="table_01">
      <tr>
        <th width="5%"><input type="checkbox" id="selectAll" title="<fmt:message key="sys.title.selectAll"/>"/></th>
        <th class="orderBy">会场提供商</th>
        <th width="15%" class="orderBy">会场名称</th>
        <th width="10%" class="orderBy">会场类型</th>
        <th width="15%" class="orderBy">容纳人数(人数)</th>
        <th width="10%" class="orderBy">面积（M<sup>2</sup>）</th>
        <th width="10%" class="orderBy">高度(M)</th>
        <th width="12%"><fmt:message key="biz.title.operation"/></th>
      </tr>
      <c:forEach items="${list}" var="bean" varStatus="i">
        <tr id="tr_${bean.id}">
          <td><input class="chk" type="checkbox" id="chk_${bean.id}"/></td>
          <td>${bean.provider.name}</td>
          <td>${bean.name}</td>
          <td><gw:lookups category="${lookups_HCLX}" lookupsCode="${bean.type}"/></td>
          <td>${bean.capacity}</td>
          <td>${bean.area}</td>
          <td>${bean.height}</td>
          <td>
            <gw:operation mode="biz" opt="v"/>
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
</body>
</html>
