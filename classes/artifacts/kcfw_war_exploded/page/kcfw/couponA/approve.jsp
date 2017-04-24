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
    	<gw:bizSearch fields="流水号,会议名称,企业名称,会议时间" path="seq,meetingName,corp.unitName,startDate"/>

    </div>
    <!--bt end-->
    <gw:pagination mode="biz"/>
    <!--table start-->
    <table class="table_01">
      <tr>
        <th width="5%"><input type="checkbox" id="selectAll" title="<fmt:message key="sys.title.selectAll"/>"/></th>
        <th width="10%" class="orderBy">流水号</th>
        <th width="10%" class="orderBy">企业名称</th>
        <th width="15%" class="orderBy">会议名称</th>
        <th width="15%">会议室名称</th>
        <th width="10%" class="orderBy">会议时间</th>
        <th width="10%" class="orderBy">科技券数量</th>
        <th width="10%">科技券金额</th>
        <th width="12%"><fmt:message key="biz.title.operation"/></th>
      </tr>
      <c:forEach items="${list}" var="bean" varStatus="i">
        <tr id="tr_${bean.id}">
          <td><input class="chk" type="checkbox" id="chk_${bean.id}"/></td>
          <td>${bean.seq}</td>
          <td>${bean.corp.unitName}</td>
          <td><a onclick="doTitleView(this)">${bean.meetingName}</a></td>
          <td>${bean.siteName}</td>
          <td><fmt:formatDate value="${bean.startDate}" pattern="yyyy-MM-dd" /></td>
          <td>${bean.amount}</td>
          <td><fmt:formatNumber pattern="0" value="${bean.meetingCost}"/></td>
          <td>
             <div>
              <a href="javascript:void(0)" onclick="doInput(this)">
	             	审批
	          </a>
            </div>
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
  var orderByList = ["seq","corp.unitName","meetingName","startDate","amount"];

</script>

</body>
</html>
